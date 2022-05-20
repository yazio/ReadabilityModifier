import SwiftUI

/// Place this struct as a background of the view to get its frame outside of its scope
/// - Parameter rect: A binding of the CGRect that observes the frame of the View
struct GeometryGetter: View
{
    @Binding var rect: CGRect

    init(rect: Binding<CGRect>)
    {
        self._rect = rect
    }

    var body: some View
    {
        GeometryReader
        {
            geometry in

            makeView(geometry: geometry)
        }
    }

    private func makeView(geometry: GeometryProxy) -> some View
    {
        DispatchQueue.main.async
        {
            self.rect = geometry.frame(in: .global)
        }
        return Rectangle().fill(Color.clear)
    }
}

/// Place this struct as a background of the view to get its frame outside of its scope
/// - Parameter rect: A binding of the CGRect that observes the frame of the View
/// - Returns: The view that the readableContentGuide padding is applied to
extension View
{
    func observeFrame(rect: Binding<CGRect>) -> some View
    {
        background(GeometryGetter(rect: rect))
    }
}
