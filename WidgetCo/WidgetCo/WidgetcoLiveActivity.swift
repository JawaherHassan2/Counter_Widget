//
//  WidgetcoLiveActivity.swift
//  Widgetco
//
//  Created by Jawaher on 01/07/1445 AH.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct WidgetcoAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WidgetcoLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WidgetcoAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WidgetcoAttributes {
    fileprivate static var preview: WidgetcoAttributes {
        WidgetcoAttributes(name: "World")
    }
}

extension WidgetcoAttributes.ContentState {
    fileprivate static var smiley: WidgetcoAttributes.ContentState {
        WidgetcoAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WidgetcoAttributes.ContentState {
         WidgetcoAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WidgetcoAttributes.preview) {
   WidgetcoLiveActivity()
} contentStates: {
    WidgetcoAttributes.ContentState.smiley
    WidgetcoAttributes.ContentState.starEyes
}
