import UIKit

class BasicDataSource: NSObject {
    
    func numberOfItems(in section: Int) -> Int {
        fatalError("\(self): \(#function) Should be implemented to get the number of item in section")
    }
    
    func getTableViewCell(in: UITableView, indexPath: IndexPath) -> ReusableCellView {
        fatalError("\(self): \(#function) Should be implemented to get the tableView cell")
    }
 
    func getCellHeight(_ indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func getLoadMoreOffset() -> Int {
        return 0
    }
    
    func getItemsCount() -> Int {
        return 0
    }
    
    func loadMore() {
        fatalError("\(self): \(#function) Should be implemented to call load more handler")
    }
}

extension BasicDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cast(self.getTableViewCell(in: tableView, indexPath: indexPath))
    }
}

extension BasicDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return getCellHeight(indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let offset = self.getLoadMoreOffset()
        guard offset != 0 else {
            return
        }
        
        guard indexPath.row >= self.getItemsCount() - offset else {
            return
        }
        self.loadMore()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}
