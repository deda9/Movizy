import UIKit

protocol GenericDataSourceProtocol {
    associatedtype Item
    
    var itemsList: [Item] { get set }
    
    func item(at: IndexPath) -> Item
    func add(item: Item, at: IndexPath)
    func replace(at indexPath: IndexPath, with item: Item)
    func remove(at indexPath: IndexPath)
}

class GenericDataSource<ItemType, CellType: ReusableCellView>: BasicDataSource, GenericDataSourceProtocol {
    
    typealias CellRowData = ((_ cell: CellType, _ item: ItemType, _ index: IndexPath) -> Void)
    typealias TableViewCellHeight = ((_ indexPath: IndexPath) -> CGFloat)
    typealias LoadMoreOffset = (() -> Int)
    typealias LoadMoreHandler = (() -> Void)
    
    var onConfigureCell: CellRowData?
    var onDidSelectCell: CellRowData?
    var onTableViewCellHeight: TableViewCellHeight?
    var loadMoreOffset: LoadMoreOffset?
    var loadMoreHandler: LoadMoreHandler?
    
    var itemsList: [ItemType] = []
    
    func setMovies(_ items: [ItemType], in tableView: UITableView) {
        self.itemsList = items
            tableView.reloadData()
    }
    
    func addItems(_ items: [ItemType], in tableView: UITableView) {
        guard !items.isEmpty else {
            return
        }
        if self.itemsList.isEmpty {
            self.setMovies(items, in: tableView)
        } else {
            let countBeforeInsert = self.itemsList.count
            self.itemsList += items
            let countAfterInsert = countBeforeInsert + items.count
            let range = countBeforeInsert...countAfterInsert - 1
            let indices = range.map {
                IndexPath(row: $0, section: 0)
            }
            UIView.performWithoutAnimation {
                tableView.insertRows(at: indices, with: .none)
            }
        }
    }
    
    func item(at indexPath: IndexPath) -> ItemType {
        return self.itemsList[indexPath.row]
    }
    
    func add(item: ItemType, at: IndexPath) {
        self.itemsList.append(item)
    }
    
    func remove(at indexPath: IndexPath) {
        self.itemsList.remove(at: indexPath.row)
    }
    
    public func replace(at indexPath: IndexPath, with item: Item) {
        self.itemsList[indexPath.item] = item
    }
    
    override func numberOfItems(in section: Int) -> Int {
        return self.itemsList.count
    }
    
    override func getTableViewCell(in tableView: UITableView, indexPath: IndexPath) -> ReusableCellView {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellType.resuableID)
        let castedCell: CellType = cast(cell)
        let item = self.item(at: indexPath)
        self.onConfigureCell?(castedCell, item, indexPath)
        return castedCell
    }
    
    override func getCellHeight(_ indexPath: IndexPath) -> CGFloat {
        return self.onTableViewCellHeight?(indexPath) ?? super.getCellHeight(indexPath)
    }
    
    override func getLoadMoreOffset() -> Int {
        return self.loadMoreOffset?() ?? 0
    }
    
    override func getItemsCount() -> Int {
        return self.itemsList.count
    }
    
    override func loadMore() {
        self.loadMoreHandler?()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let castedCell: CellType = cast(cell)
        let item = self.item(at: indexPath)
        self.onDidSelectCell?(castedCell, item, indexPath)
    }
}
