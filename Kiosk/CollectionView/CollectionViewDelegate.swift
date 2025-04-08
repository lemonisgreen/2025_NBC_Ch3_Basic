//
//  CollectionViewDelegate.swift
//  asfsadfsdaf
//
//  Created by 최규현 on 4/7/25.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 셀의 수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
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
    
    // 셀에 표시될 아이템(CollectionViewCell에서 configure 메서드에 UI에 띄우는 로직을 구현해둠)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
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
    
    // 셀의 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 하나씩 밑으로 늘어뜨린 리스트형식으로 출력되게 할 것이기 때문에 width를 cellectionView와 같게 함
        let width = collectionView.bounds.width
        return CGSize(width: width, height: 100)
    }
    
}
