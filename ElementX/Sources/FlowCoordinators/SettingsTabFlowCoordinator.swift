import Combine
import Foundation

enum SettingsTabFlowCoordinatorAction {
    case logout
    case clearCache
    case forceLogout
}

class SettingsTabFlowCoordinator: FlowCoordinatorProtocol {
    private let userSession: UserSessionProtocol
    private let flowParameters: CommonFlowParameters
    private let navigationStackCoordinator: NavigationStackCoordinator
    private let appLockService: AppLockServiceProtocol
    
    private var settingsFlowCoordinator: SettingsFlowCoordinator?
    private var cancellables: Set<AnyCancellable> = []

    private let actionsSubject: PassthroughSubject<SettingsTabFlowCoordinatorAction, Never> = .init()
    var actionsPublisher: AnyPublisher<SettingsTabFlowCoordinatorAction, Never> {
        actionsSubject.eraseToAnyPublisher()
    }

    init(appLockService: AppLockServiceProtocol,
         navigationStackCoordinator: NavigationStackCoordinator,
         flowParameters: CommonFlowParameters) {
        self.appLockService = appLockService
        self.navigationStackCoordinator = navigationStackCoordinator
        self.flowParameters = flowParameters
        userSession = flowParameters.userSession
    }

    func start(animated: Bool = true) {
        presentSettingsScreen()
    }

    func handleAppRoute(_ appRoute: AppRoute, animated: Bool) {
        switch appRoute {
        case .settings, .chatBackupSettings:
            presentSettingsScreen()
        default:
            break
        }
    }

    func clearRoute(animated: Bool) {
        // Tab ichida clearing kerak emas
    }

    func stop() {
        cancellables.removeAll()
        settingsFlowCoordinator = nil
    }

    // MARK: - Private

    private func presentSettingsScreen() {
        let flowCoordinator = SettingsFlowCoordinator(appLockService: appLockService,
                                                      isInSecondaryWindow: false,
                                                      navigationStackCoordinator: navigationStackCoordinator,
                                                      flowParameters: flowParameters)

        flowCoordinator.actions.sink { [weak self] action in
            guard let self else { return }

            switch action {
            case .dismiss:
                break
            case .clearCache:
                actionsSubject.send(.clearCache)
            case .runLogoutFlow:
                actionsSubject.send(.logout)
            case .forceLogout:
                actionsSubject.send(.forceLogout)
            default:
                break
            }
        }
        .store(in: &cancellables)

        flowCoordinator.handleAppRoute(.settings, animated: false)
        settingsFlowCoordinator = flowCoordinator
    }
}
