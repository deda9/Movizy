import Foundation

class Throttler {
    private let queue = DispatchQueue.global(qos: .background)
    private var job = DispatchWorkItem(block: {})
    private var perviuosRun: Date = Date()
    private var maxInterval: Double = 1.0
    
    init(maxInterval: Double) {
        self.maxInterval = maxInterval
    }
    
    func throttle(block: @escaping () -> Void) {
        self.job.cancel()
        self.job = DispatchWorkItem { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.perviuosRun = Date()
            block()
        }
        let delay = Date.second(from: perviuosRun) > maxInterval ? 0 : maxInterval
        self.queue.asyncAfter(deadline: .now() + Double(delay), execute: job)
    }
}

private extension Date {
    static func second(from referenceDate: Date) -> Double {
        return Date().timeIntervalSince(referenceDate).rounded()
    }
}
