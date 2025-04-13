///
/// Copyright 2020 Alexander Kozin
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// El Machine 🤖

///Array
extension Array {

    public
    static
    func - (p: Self, index: Index) -> Self {
        var copy = p
        copy.remove(at: index)
        return copy
    }

}

extension Array where Element: Equatable {

    public
    static
    func - (p: Self, element: Element) -> Self {
        var copy = p
        if let index = copy.firstIndex(of: element) {
            copy.remove(at: index)
        }

        return copy
    }

}

///Dictionary
extension Dictionary {

    public
    static
    func - (p: Self, key: Key) -> Self {
        var copy = p
        copy.removeValue(forKey: key)
        return copy
    }

}

///IndexPath
#if !os(iOS)
@available(iOS 7.0, watchOS 2.0, *)
public
func - (path: IndexPath, right: (row: Int, section: Int)) -> IndexPath {
    IndexPath(row: max(0, path.row - right.row),
              section: max(0, path.section - right.section))
}
#endif
