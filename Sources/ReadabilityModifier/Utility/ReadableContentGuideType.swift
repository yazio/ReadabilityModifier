import Foundation

/// Enum to select if the ReadableContentGuide should be applied by adding padding or setting the width of a view.
/// Can be helpful to avoid strange animations and to nest multiple views with readableContentGuide, so that the padding does not stack.
public enum ReadableContentGuideType
{
    case padding
    case width
}
