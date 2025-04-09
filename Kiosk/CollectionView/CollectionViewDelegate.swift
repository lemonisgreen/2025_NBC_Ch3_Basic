//
//  CollectionViewDelegate.swift
//  asfsadfsdaf
//
//  Created by 최규현 on 4/7/25.
//

import UIKit

// MARK: - 컬렉션 뷰 데이터소스
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 컬렉션 뷰가 장바구니일때
        if collectionView == cartCollectionView {
            return cartItems.count
        } else {
            switch SegmentState(rawValue: state) {
            case .jeontongjoo:
                return jeontongjooList.count
            case .wine:
                return wineList.count
            case .sake:
                return sakeList.count
            default:
                return 0
            }
        }
    }
    
    // 셀에 표시될 아이템(CollectionViewCell에서 configure 메서드에 UI에 띄우는 로직을 구현해둠)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 컬렉션 뷰가 장바구니일때
        if collectionView == cartCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCell", for: indexPath) as? CartCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let itemName = cartItems[indexPath.item]
            cell.configure(itemName: itemName) // 셀 안에 텍스트 설정
            
            // 구분선 생성 및 마지막 셀 구분선 숨김 처리
            let isLastCell = indexPath.item == cartItems.count - 1
            cell.separatorView.isHidden = isLastCell
            
            return cell // 아직 구현 안됨
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
            
            switch SegmentState(rawValue: state) {
            case .jeontongjoo:
                cell.configure()
                cell.setJeontongjoo(jeontongjooList[indexPath.item])
            case .wine:
                cell.configure()
                cell.setWine(wineList[indexPath.item])
            case .sake:
                cell.configure()
                cell.setSake(sakeList[indexPath.item])
            default:
                print("Error")
            }
            
            return cell
        }
    }
}


// MARK: - 컬렉션 뷰 델리게이트
extension ViewController: UICollectionViewDelegate {
    // 선택된 item을 호출할 메서드
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if collectionView == cartCollectionView {
            return
        } else {
            var selectedItem: String?
            
            switch SegmentState(rawValue: state) {
            case .jeontongjoo:
                selectedItem = jeontongjooList[indexPath.item].name
            case .wine:
                selectedItem = wineList[indexPath.item].name
            case .sake:
                selectedItem = sakeList[indexPath.item].name
            default:
                print("Error")
            }
            
            // 상품 선택 시, 장바구니에 상품 데이터 전송
            if let name = selectedItem {
                cartItems.append(name) // 장바구니에 담기
                cartCollectionView.reloadData() // 장바구니 새로고침
            }
        }
    }
}


// MARK: - 컬렉션 뷰 플로우 레이아웃
extension ViewController: UICollectionViewDelegateFlowLayout {
    // 셀의 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == cartCollectionView {
            return CGSize(width: 351, height: 40)
        } else {
            // 하나씩 밑으로 늘어뜨린 리스트형식으로 출력되게 할 것이기 때문에 width를 cellectionView와 같게 함
            let width = collectionView.bounds.width
            return CGSize(width: width, height: 120)
        }
    }
}

