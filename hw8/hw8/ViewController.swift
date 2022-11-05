import UIKit

 class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

     private let sections  = Data().dataList
          private let collectionView: UICollectionView = {
              let collectionViewLayout = UICollectionViewLayout()
              let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
              collectionView.backgroundColor = .clear
              collectionView.translatesAutoresizingMaskIntoConstraints = false
              return collectionView
          }()


          override func viewDidLoad() {
              super.viewDidLoad()

              setup()
              collectionView.dataSource = self
              collectionView.delegate = self
          }

          func numberOfSections(in collectionView: UICollectionView) -> Int {
              return sections.count
          }

          func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
              return sections[section].count
          }

          func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
              switch sections[indexPath.section]{

              case .new(let new):
                  guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewMusicCollectionViewCell", for: indexPath) as? NewMusicCollectionViewCell else {return UICollectionViewCell()}
                  cell.configureCell(imageName: new[indexPath.row].image)
                  return cell
              case .popular(let popular):
                  guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularCollectionViewCell", for: indexPath) as? PopularCollectionViewCell else {return UICollectionViewCell()}
                  cell.configureCell(title: popular[indexPath.row].name, imageName: popular[indexPath.row].image)
                  return cell
              }
          }

          func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
              switch kind{
              case UICollectionView.elementKindSectionHeader:
                  let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionReusableView", for: indexPath) as! CollectionReusableView
                  header.configureCell(headerName: sections[indexPath.section].title)
                  return header
              default:
                  return UICollectionReusableView()
              }
          }

          private func setup(){
              view.backgroundColor = .white
              view.addSubview(collectionView)
              collectionView.register(NewMusicCollectionViewCell.self, forCellWithReuseIdentifier: "NewMusicCollectionViewCell")
              collectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: "PopularCollectionViewCell")
              collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CollectionReusableView")
              collectionView.collectionViewLayout = Layout()
              NSLayoutConstraint.activate([
                  collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                  collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                  collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                  collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
              ])
          }


          private func Layout() -> UICollectionViewCompositionalLayout{

              UICollectionViewCompositionalLayout{[weak self] sectionIndex, _ in
                  guard let self = self else {return nil}
                  let section = self.sections[sectionIndex]
                  switch section{
                  case .new(_):
                      return self.createAnimeSection()
                  case .popular(_):
                      return self.createWallpaperSection()
                  }
              }
          }

          private func createAnimeSection() -> NSCollectionLayoutSection{
              let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
              item.contentInsets = .init(top: 2, leading: 5, bottom: 5, trailing: 5)
              let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3)), subitems: [item, item])
              let section = NSCollectionLayoutSection(group: group)
              let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.05)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
              section.orthogonalScrollingBehavior = .groupPaging
              section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
              section.boundarySupplementaryItems = [header]
              return section
          }

          private func createWallpaperSection() -> NSCollectionLayoutSection{
              let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))

              let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3)), subitems: [item])
              let section = NSCollectionLayoutSection(group: group)
              let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.05)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
              section.interGroupSpacing = 20
              section.contentInsets = .init(top: 5, leading: 3, bottom: 5, trailing: 3)
              section.boundarySupplementaryItems = [header]
              return section
          }
      }
