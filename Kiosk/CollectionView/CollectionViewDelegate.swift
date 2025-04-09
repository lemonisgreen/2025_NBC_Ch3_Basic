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
        if collectionView == cartCollectionView { // 컬렉션 뷰가 장바구니일때
            return 0 // 아직 구현 안되서 초기값 설정
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
        if collectionView == cartCollectionView{ // 컬렉션뷰가 장바구니일 때
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartCell", for: indexPath) as? CartCollectionViewCell else {
                return UICollectionViewCell()
            }
            
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
        switch SegmentState(rawValue: state) {
        case .jeontongjoo:
            let selectedItem = jeontongjooList[indexPath.item]
            print(selectedItem.name)
        case .wine:
            let selectedItem = wineList[indexPath.item]
            print(selectedItem.name)
        case .sake:
            let selectedItem = sakeList[indexPath.item]
            print(selectedItem.name)
        default:
            print("Error")
        }
    }
}

// MARK: - 컬렉션 뷰 플로우 레이아웃
extension ViewController: UICollectionViewDelegateFlowLayout {
    // 셀의 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 하나씩 밑으로 늘어뜨린 리스트형식으로 출력되게 할 것이기 때문에 width를 cellectionView와 같게 함
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 120)
    }
}

