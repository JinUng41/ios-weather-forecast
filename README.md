### 날씨정보 프로젝트 저장소

## 🖇️ 개요

위도와 경도를 기반으로 하는 현재 위치 또는 지정 위치에 따라 날씨 정보를 확인할 수 있는 앱

### 🙋 팀원
|bello|roks|
|-----|----|
|<img src="https://github.com/KimRoks/ios-weather-forecast/assets/113083860/a9763525-4838-4353-a186-0d403d2fc080)" width="180" height="180" alt="[IMG_1356 PNG]">|<img src="https://github.com/KimRoks/ios-weather-forecast/assets/113083860/31c76394-e6fd-488b-94a6-de0025bd5135)" width="180" height="180" alt="[IMG_5293]">|



### 🗓️ 기간

23.11.20 ~ 23.12.22

## 📁 디렉토리 구조

```
.
├── WeatherForecast
│   ├── Controllers
│   │   └── WeatherViewController.swift
│   ├── Extensions
│   │   ├── Bundle.swift
│   │   ├── DateFormatter.swift
│   │   └── UIComponents.swift
│   ├── Info.plist
│   ├── Models
│   │   ├── APIRequest
│   │   │   ├── Implementations
│   │   │   │   ├── IconRequest.swift
│   │   │   │   └── WeatherRequest.swift
│   │   │   └── Protocols
│   │   │       └── APIRequest.swift
│   │   ├── Location
│   │   │   └── LocationData.swift
│   │   └── Weather
│   │       ├── Current.swift
│   │       ├── Forecast.swift
│   │       └── WeatherType.swift
│   ├── Protocols
│   │   ├── AlertDisplayable.swift
│   │   ├── LocationChangeable.swift
│   │   ├── Reusable.swift
│   │   └── URLSession
│   │       ├── URLSessionDataTaskProtocol.swift
│   │       └── URLSessionProtocol.swift
│   ├── Resources
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   │   ├── AccentColor.colorset
│   │   │   │   └── Contents.json
│   │   │   ├── AppIcon.appiconset
│   │   │   │   └── Contents.json
│   │   │   ├── Contents.json
│   │   │   ├── backgroundImage.imageset
│   │   │   │   ├── Contents.json
│   │   │   │   └── diego-ph-5LOhydOtTKU-unsplash.jpg
│   │   │   └── wallpaper.imageset
│   │   │       ├── Contents.json
│   │   │       └── wallpaper.jpg
│   │   └── SceneDelegate.swift
│   ├── Utilities
│   │   ├── Cache
│   │   │   ├── Implementations
│   │   │   │   └── ImageMemoryCacheManager.swift
│   │   │   └── Protocols
│   │   │       └── ImageCacheable.swift
│   │   ├── Location
│   │   │   └── LocationManager.swift
│   │   └── Network
│   │       ├── NetworkError.swift
│   │       └── NetworkManager.swift
│   └── Views
│       ├── Base.lproj
│       │   └── LaunchScreen.storyboard
│       ├── ForecastCell.swift
│       ├── WeatherHeaderView.swift
│       └── WeatherView.swift
```

## 📌 주요 객체 역할

### Controllers

| 이름 | 타입 | 설명 |
| --- | --- | --- |
| WeatherViewController | final class | 위치, 날씨 데이터를 받아 뷰에 그리도록 요청함. |

### APIRequest

| 이름 | 타입 | 설명 |
| --- | --- | --- |
| APIRequest | protocol | URL을 만들기 위한 구성 요소를 요구함. |
| WeatherRequest | struct | 날씨 요청을 위한 URL 구성 요소를 정의 |
| IconRequest | struct | 날씨 이미지 요청을 위한 URL 구성 요소를 정의 |

### Location

| 이름 | 타입 | 설명 |
| --- | --- | --- |
| LocationData | struct | 위치 (위도, 경도)와 GeoCoder로 변환한 주소를 가지는 구조체 |
| LocationManager | final class | 권한에 따른 위치 (위도, 경도) 요청과 주소 변환을 수행하는 객체 |

### Cache

| 이름 | 타입 | 설명 |
| --- | --- | --- |
| ImageCacheable | protocol | 이미지 캐싱에 대한 함수를 요구함. |
| ImageMemoryCacheManager | final class | NSCache를 이용하여 메모리에 이미지 캐싱을 수행하는 객체 |

### Network

| 이름 | 타입 | 설명 |
| --- | --- | --- |
| NetworkManager | final class | APIRequest를 받아 네트워크 작업을 수행하는 객체 |
| NetworkError | enum | 네트워크 작업 수행 시 발생할 수 있는 오류에 대한 정의 |

## ⭐️ 핵심 구현 내용

 **CollectionView**

- `UICollectionViewCompositionalLayout`으로 컬렉션 뷰 레이아웃 구성
- `UICollectionViewDiffableDataSource`를 이용한 데이터 소스 구성

**CoreLocation**

- `Core Location`을 이용한 사용자 위치 데이터 요청
- `CLGeocoder`와 `CLPlacemark`를 통한 주소 변환

**URLSession**

- 외부에서 주입 가능한 `URLSession`과 NetworkManager
- `URLSession` 을 통한 외부 API와 통신
- 범용성, 재사용성, 유연성을 고려한 네트워킹 타입 구현

**ImageCache**

- `NSCache`를 이용하여 날씨 아이콘 이미지 캐싱

## 📱 동작화면
|메인화면|새로고침|위‧경도 입력|
|------|------|---------|
<img src="https://github.com/KimRoks/ios-weather-forecast/assets/113083860/35247f02-1dc3-4e2d-ab50-c0b5a79a93a3" width="auto" height="330" alt="[날씨앱 기본1gif]">|<img src="https://github.com/KimRoks/ios-weather-forecast/assets/113083860/afc3cda3-7d65-4107-990b-e5fe6ddf49fc" width="auto" height="330" alt="[날씨앱 새로고침 gif]">|<img src="https://github.com/KimRoks/ios-weather-forecast/assets/113083860/5466ff65-9a55-4df0-ad3b-f2fb6dc77445" width="auto" height="330" alt="[날씨앱위치전환]">|











## 🌠 Trouble Shooting

### 외부에서 URLSession을 주입받는 NetworkManager

초기 네트워크 작업을 수행하는 NetworkManager 객체가 사용하는 URLSession을 직접 사용하고 있었습니다.

하지만 테스트가 가능한 코드는 무엇일까에 대한 고민을 하게 되었고, 실제 유닛 테스트를 진행할 때에는 네트워크 작업을 수행하지 않으면서 테스트가 가능해야 했습니다.

이에 따라 **URLSessionProtocol**과 **URLSessionDataTaskProtocol**을 정의하고 NetworkManager에서 두 프로토콜의 객체를 사용합니다.

실제 네트워크 작업을 수행 시에는 두 프로토콜을 따르는 URLSession과 URLSessionDataTask를 사용하고, 테스트 시에는 **MockURLSession**과 **MockURLSessionDataTask**를 사용하도록 구현하였습니다.

이를 통해 테스트 가능한 네트워크 작업을 수행하는 코드를 만들어 낼 수 있었습니다.

### reuseIdentifier를 어떻게 정의할 수 있을까?

컬렉션 뷰에 대해서 코드로 UI를 구성한다고 할 때, 커스텀 셀과 헤더 뷰 등을 `register`하는 과정, 데이터 소스를 구성하는 과정 모두 셀의 reuseIdentifier를 필요로 합니다.

```swift
static let reuseIdentifier = "reuseIdentifier"
```

위와 같이 타입 프로퍼티로 직접 선언하였을 때의 문제점은 휴먼 에러, 즉 오타가 발생했을 시에 발견하기 어렵다는 점입니다.

```swift
static var reuseIdentifier: String { return String(describing: self) }
```

이를 해결하기 위해 Reusable이라는 프로토콜을 선언하여 이러한 휴먼 에러를 방지할 수 있었습니다.

### 컬렉션 뷰의 dataSource 구성 코드의 위치

기존에 저희는 ViewController가 컬렉션 뷰의 dataSource를 구성해야 한다고 당연하게 생각해 왔습니다.
컬렉션 뷰의 dataSource를 구성하는 코드의 위치에 대한 의문이 들게 되었고, ViewController와 View의 역할에 대해 생각을 해보게 되었습니다.

이러한 의문을 해결하기 위해 컬렉션 뷰를 가지는 커스텀 뷰인 WeatherView에서 dataSource를 프로퍼티로 가지면서 구성되도록 해보았습니다.
이 때 UICollectionViewDiffableDataSource를 이용하여 dataSource를 구성해 보았습니다.

이를 통해 저희가 얻을 수 있었던 결론은 다음과 같습니다. :

- ViewController
    - Model과 Manager를 통해 화면에 띄워주어야 할 데이터를 받습니다.
    - 받은 데이터를 어느 뷰에 보여줄 것인지 결정합니다.
- View
    - ViewController로부터 데이터를 받습니다.
    - 내부적으로 어떤 내부 요소에 해당 데이터를 보여줄 것인지 결정합니다.

결과적으로 현재 프로젝트에서는 ViewController가 LocationManager, NetworkManager를 통해 필요한 데이터인 위치 정보와 날씨 정보를 받습니다.
받은 데이터를 가지고 WeatherView에 데이터를 표시하도록 받은 데이터를 전달합니다.

WeatherView에서는 받은 데이터를 가지고 어떠한 형식으로 보여줄 것인지 결정하는데, 
이때 UICollectionViewDiffableDataSource를 이용하여 컬렉션 뷰에 전달받은 데이터를 보여줌으로써 객체의 역할을 더욱 명확히 할 수 있었습니다.

---

[날씨앱 [STEP 1] roks,bello by KimRoks · Pull Request #21 · tasty-code/ios-weather-forecast](https://github.com/tasty-code/ios-weather-forecast/pull/21)

[날씨 앱 [STEP2] roks, bello by KimRoks · Pull Request #32 · tasty-code/ios-weather-forecast](https://github.com/tasty-code/ios-weather-forecast/pull/32)

[날씨 앱 [STEP3-1] bello, roks by KimRoks · Pull Request #39 · tasty-code/ios-weather-forecast](https://github.com/tasty-code/ios-weather-forecast/pull/39)

[날씨 앱 [STEP3-2] bello, roks  by KimRoks · Pull Request #45 · tasty-code/ios-weather-forecast](https://github.com/tasty-code/ios-weather-forecast/pull/45)

[날씨 앱 [STEP4] bello, roks by KimRoks · Pull Request #48 · tasty-code/ios-weather-forecast](https://github.com/tasty-code/ios-weather-forecast/pull/48)
