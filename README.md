# LNParallaxTVCell - Swift

![iOS](https://img.shields.io/badge/pod-1.0.0-blue.svg)
![Platform](http://img.shields.io/badge/platform-iOS-green.svg?style=flat) 
![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![License](http://img.shields.io/badge/license-BSD-lightgrey.svg?style=flat)](https://github.com/LanarsInc/LNParallaxTVCell/blob/master/LICENSE)

A subclass of UITableViewCell to present the parallax effect. You won't use UITableViewDelegate or something else, you can use it simply like UITableViewCell, or customize parallax ratio or another properties.

![Preview](https://github.com/LanarsInc/LNParallaxTVCell/blob/master/DEMO.gif)

## Installation

To install via CocoaPods add this lines to your Podfile:

```ruby
pod 'LNParallaxTVCell'
```

To install manually LNParallaxTVCell in an app, just drag LNParallaxTVCell.swift class into your project

## Usage

1. Import LNParallaxTVCell module to your class

```swift
import LNParallaxTVCell
```

2. Set your UITableViewCell class as LNParallaxTVCell in storyboard or .xib file

3. Set your image as "parallaxImage" to display
```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as? LNParallaxTVCell else {
        return UITableViewCell()
    }
        
    cell.parallaxImage.image = UIImage(named: "myImage")      
    
    return cell
}
```

4. Optional - You can change parralaxRatio from 0.0 to 1.0 (default value is 0.5)
```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier") as? LNParallaxTVCell else {
        return UITableViewCell()
    }
        
    cell.parallaxImage.image = UIImage(named: "myImage")
    cell.parallaxRatio = 1.0
        
    return cell
}
```

Also check out [an example project with parralax table view cell](https://github.com/LanarsInc/LNParallaxTVCell/tree/master/LNParallaxTVCellExample)

## License

Copyright © 2019 Lanars

https://lanars.com

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
