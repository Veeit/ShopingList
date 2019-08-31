import Foundation
import SwiftUI


//  MARK: listItems
//  The items that are shown in the navigation.
/// title: String      | The Title that is shown
/// image: String      | The Icon next to the Title
/// imageColor: Color  | The Icon Color, default white
/// contentView: View  | The view that the Item is link too
 
enum listItems: Int, CaseIterable, Identifiable {
    var id: Int {
        return self.rawValue
    }
    
    case add, current
    
    var title: String {
        switch self {
            case .current:  return "your List"
            case .add:  return "Add"
        }
    }
    
    var image: String {
        switch self {
            case .current:  return "rectangle.grid.1x2"
            case .add:  return "plus.circle"
        }
    }
    
    var imageColor: Color {
        switch self {
            case .current: return Color.blue
            case .add: return Color.green
            default: return Color.primary
        }
    }

    var contentView: AnyView {
        switch self {
            case .current:  return AnyView( NavigationView { currentList() }.navigationViewStyle(StackNavigationViewStyle()))
            case .add:  return AnyView(NavigationView { addItemView() }.navigationViewStyle(StackNavigationViewStyle()))
        }
    }
}

