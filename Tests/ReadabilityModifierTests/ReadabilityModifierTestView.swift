import ReadabilityModifier
import SwiftUI

struct ReadabilityModifierTestView: View
{
    let contentGuideType: ReadableContentGuideType
    let extraSpacing: CGFloat
    let onWidthSet: (CGFloat) -> Void

    var body: some View
    {
        NavigationView
        {
            VStack
            {
                GeometryReader
                {
                    geometry in

                    Color.white
                        .onChange(of: geometry.size.width)
                        {
                            newWidth in
                            if newWidth > 0
                            {
                                onWidthSet(newWidth)
                            }
                        }
                }
                .fitToReadableContentGuide(
                    extraSpacing: extraSpacing,
                    type: contentGuideType
                )
            }
        }
    }
}
