import EosKit
import RxSwift

protocol IAdapter {

    var name: String { get }
    var coin: String { get }

    var lastBlockHeight: Int? { get }
    var syncState: EosKit.SyncState { get }
    var balance: Decimal { get }

    var receiveAddress: String { get }

    var lastBlockHeightObservable: Observable<Void> { get }
    var syncStateObservable: Observable<Void> { get }
    var balanceObservable: Observable<Void> { get }
    var transactionsObservable: Observable<Void> { get }

    func validate(address: String) throws
    func sendSingle(to address: String, amount: Decimal) -> Single<Void>
    func transactionsSingle(fromActionSequence: Int?, limit: Int?) -> Single<[Transaction]>

}