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

import Foundation

///Array
extension Array {

    public
    static
    func + (p: Self, element: Element) -> Self {
        var copy = p
        copy.append(element)
        return copy
    }

}

public
func +<K> (l: Array<K>?, r: Array<K>?) -> Array<K>? {
    guard let l = l , !l.isEmpty else {
        return r
    }

    guard let r = r , !r.isEmpty else {
        return l
    }

    return l + r
}

public
func +<T> (l: T, r: T) -> Array<T> {
    [l, r]
}

///Dictionary
public
func +<K,V> (l: Dictionary<K,V>?, r: Dictionary<K,V>?) -> Dictionary<K,V>? {
    guard let l = l , !l.isEmpty else {
        return r
    }

    guard let r = r , !r.isEmpty else {
        return l
    }

    return l.merging(r) {
        $1
    }
}
