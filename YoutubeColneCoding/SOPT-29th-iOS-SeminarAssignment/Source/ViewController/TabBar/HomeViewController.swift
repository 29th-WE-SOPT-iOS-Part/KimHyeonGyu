//
//  HomeViewController.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/10/19.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties

    private var channelList = [ChannelData]()
    private var thumbnailList = [ThumbnailData]()
    private var categoryList = [String]()
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var customNavigationBar: UIView!
    @IBOutlet weak var channelCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var thumbnailTableView: UITableView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
        assignDelegate()
        registerXib()
        setList()
    }
}

// MARK: - Extensions

extension HomeViewController {
    private func initNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func assignDelegate() {
        channelCollectionView.delegate = self
        channelCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        thumbnailTableView.delegate = self
        thumbnailTableView.dataSource = self
    }
    
    private func registerXib() {
        channelCollectionView.register(UINib(nibName: Const.Xib.NibName.channelCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Const.Xib.NibName.channelCollectionViewCell)
        categoryCollectionView.register(UINib(nibName: Const.Xib.NibName.categoryCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Const.Xib.NibName.categoryCollectionViewCell)
        thumbnailTableView.register(UINib(nibName: Const.Xib.NibName.thumbnailTableViewCell, bundle: nil), forCellReuseIdentifier: Const.Xib.NibName.thumbnailTableViewCell)
    }
    
    private func setList() {
        channelList.append(contentsOf: [ChannelData(image: "ggamju1", channel: "iOSPart"),
                                        ChannelData(image: "ggamju2", channel: "AndroidPart"),
                                        ChannelData(image: "ggamju3", channel: "ServerPart"),
                                        ChannelData(image: "ggamju4", channel: "WebPart"),
                                        ChannelData(image: "ggamju5", channel: "DesignPart"),
                                        ChannelData(image: "ggamju6", channel: "PlanPart")])
        categoryList.append(contentsOf: ["전체",
                                         "오늘",
                                         "이어서 시청하기",
                                         "시청하지 않음",
                                         "실시간",
                                         "게시물"])
        thumbnailList.append(contentsOf: [ThumbnailData(thumbnailImage: "wesoptiOSPart", channelImage: "wesoptProfile", title: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
                                          ThumbnailData(thumbnailImage: "wesoptiOSPart", channelImage: "wesoptProfile", title: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
                                          ThumbnailData(thumbnailImage: "wesoptiOSPart", channelImage: "wesoptProfile", title: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
                                          ThumbnailData(thumbnailImage: "wesoptiOSPart", channelImage: "wesoptProfile", title: "4차 iOS 세미나 : Cocoapods & Networking, REST API", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전"),
                                          ThumbnailData(thumbnailImage: "wesoptiOSPart", channelImage: "wesoptProfile", title: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화 ", subtitle: "WE SOPT ・조회수 100만회 ・ 3주 전")])
        channelCollectionView.reloadData()
        categoryCollectionView.reloadData()
        thumbnailTableView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == channelCollectionView {
            return channelList.count
        } else if collectionView == categoryCollectionView {
            return categoryList.count
        } else { return 0 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == channelCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.Xib.NibName.channelCollectionViewCell, for: indexPath) as? ChannelCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.setDataWith(channelImage: channelList[indexPath.item].image, channelText: channelList[indexPath.item].channel)
            return cell
        } else if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.Xib.NibName.categoryCollectionViewCell, for: indexPath) as? CategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.setDataWith(categoryText: categoryList[indexPath.item])
            return cell
        } else { return UICollectionViewCell() }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == channelCollectionView {
            return 0
        } else if collectionView == categoryCollectionView {
            return 9
        } else { return 0 }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == channelCollectionView {
            return UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
        } else if collectionView == categoryCollectionView {
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        } else { return .zero }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == channelCollectionView {
            let cellWidth: CGFloat = 72
            let cellHeight = channelCollectionView.frame.height
            return CGSize(width: cellWidth, height: cellHeight)
        } else if collectionView == categoryCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.Xib.NibName.categoryCollectionViewCell, for: indexPath) as? CategoryCollectionViewCell else {
                return .zero
            }
            
            let cellHeight: CGFloat = 32
            let cellSize = cell.sizeFittingWith(cellHeight: cellHeight, text: categoryList[indexPath.row])
            return cellSize
        } else { return .zero }
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate { }

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thumbnailList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Const.Xib.NibName.thumbnailTableViewCell, for: indexPath) as? ThumbnailTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setDataWith(thumbnailImage: thumbnailList[indexPath.row].thumbnailImage, channelImage: thumbnailList[indexPath.row].channelImage, titleText: thumbnailList[indexPath.row].title, subtitleText: thumbnailList[indexPath.row].subtitle)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}
