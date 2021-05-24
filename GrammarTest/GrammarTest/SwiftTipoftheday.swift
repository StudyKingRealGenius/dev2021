//
//  SwiftTipoftheday.swift
//  GrammarTest
//
//  Created by 권해진 on 2021/02/03.
//

import Foundation

//MARK: ----- 02 swift 에서 foreach 반복문을 표현하는 방법들을 한번 모아봤습니다. -----
/**
 var myArray: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
 
 // foreach
 for item in myArray {
     print("item : \(item)")
 }
 
 for item in myArray where item > 5 {
     print("5보다 큰 수 : \(item)")
 }
 
 for item in myArray where item % 2 == 0 {
     print("짝수 : \(item)")
 }
 */

//MARK: ----- 03 swift 에서 enum을 표현하는 방법들을 한번 모아봤습니다. -----
/**
 enum School {
     case elementary
     case middle
     case high
     case company, boss, worker
 }
 let yourSchool = School.elementary
 
 enum Grade: Int {
     case first = 1
     case second = 2
 }
 let yourGrade = Grade.second
 
 enum SchoolDetail {
     case elementary(name: String)
     case middle(name: String)
     
     func get() -> String {
         switch self {
         case .elementary(let name) :
             return name
         case .middle(let name) :
             return name
         }
     }
 }
 
 print("yourSchool: \(yourSchool)")
 print("yourGrade: \(yourGrade.rawValue)")
 
 let yourMiddleSchoolName = SchoolDetail.middle(name: "ppak-coders")
 print("yourMiddleSchoolName : \(yourMiddleSchoolName.get())")
 */

//MARK: ----- 04 swift 에서 for 반복문을 표현하는 방법들을 한번 모아봤습니다. -----
/**
 // 6번 0 -> 5
 for i in 0...5 {
     print("호호 i: \(i)")
 }
 
 // 5번 0 -> 4 (5보다 작은 수까지 반복)
 // 즉 i가 처음에는 0부터 시작
 // 반복을 뜻하는 iterate 때문에 i로 쓰는게 일반적
 for i in 0..<5 {
     print("호호 i: \(i)")
 }
 
 // 0 -> 4 까지 짝수인 놈들만
 for i in 0..<5 where i % 2 == 0 {
     print("호호 i: \(i)")
 }
 
 var randomInts: [Int] = []
 
 // 변수라고 생각하면 된다.
 // i는 사용하지 않으면 _ 언더바로 쓰면 된다.
 for _ in 0..<25 {
     let randomNumber = Int.random(in: 0...100)
     randomInts.append(randomNumber)
 }
 print("randomInts: \(randomInts)")
 */

//MARK: ----- 05 swift 에서 옵셔널 변수 언래핑(unwrapping)을 하는 방법들을 한번 모아봤습니다. -----
/**
 // 값이 비었다. 아직 값을 설정하지 않은 상태
 var someVariable: Int?
 
 // 값이 비어있다면 변수에 값을 넣는다.
 if someVariable == nil {
     someVariable = 90
 }
 
 // 변수에 값이 비어있는지 확인한다.
 if let otherVariable = someVariable {
     print("값이 있다. otherVariable: \(otherVariable)")
 } else {
     print("값이 없다.")
 }
 
 someVariable = nil
 // someVariable 에 값이 없다면 기본값으로 요녀석을 넣겠다.
 let myValue = someVariable ?? 10
 print("myValue: \(myValue)")
 
 var emptyVariable: Int?
 
 myFunction(paramenter: myValue)
 myFunction(paramenter: emptyVariable)
 
 func myFunction(paramenter: Int?) {
     print("myFunction() called")
     // 값이 없으면 리턴 해버린다. 즉 지나가버린다.
     guard let unWrappedParam = paramenter else { return }
     print("unWrappedParam: \(unWrappedParam)")
 }
 */

//MARK: ----- 06 swift 에서 클래스와 스트럭트의 차이를 한 번 알아보았습니다. -----
/**
 // memberwise initializer 때문에 좋다.
 // 생성자륾 만들지 않아도 좋다. 알아서 만들어줌
 struct YoutuberStruct {
     var name: String
     var subscribersCount: Int
 }
 var devJeong = YoutuberStruct(name: "jeongDaeRi", subscribersCount: 99999)
 
 // 클래스
 class Youtuber {
     var name: String
     var subscribersCount: Int
     // init으로 매개변수 가진 생성자 메소드를 만들어야 매개변수 넣고 객체 생성가능
     init(name: String, subscribersCount: Int) {
         self.name = name
         self.subscribersCount = subscribersCount
     }
 }
 
 var devJeongClone = devJeong
 print("devJeongClone.name: \(devJeongClone.name)")
 devJeongClone.name = "hoho"
 
 // 값 복사이기 때문에 둘의 값이 다릅니다.
 print("struct - devJeongClone.name: \(devJeongClone.name)")
 print("struct - devJeong.name: \(devJeong.name)")
 
 let jeongDaeRi = Youtuber(name: "jeongDaeRi", subscribersCount: 9999999)
 let me = jeongDaeRi
 print("class - me.name: \(me.name)")
 me.name = "hoho"
 
 // 너와 나는 운명 공동체? 서로 연결되어있기 때문에 (참조) 둘다 값이 변경됩니다.
 print("class - me.name: \(me.name)")
 print("class - jeongDaeRi.name: \(jeongDaeRi.name)")
 */

//MARK: ----- 07 property observer -----
/**
 var myAge = 0 {
     willSet {
         print("값이 설정될 예정이다. / myAge: \(myAge)")
     }
     didSet {
         print("값이 설정되었다. / myAge: \(myAge)")
     }
 }
 
 print("myAge: \(myAge)")
 
 myAge = 20
 */

//MARK: ----- 08 함수 정의 시 매개 변수 이름 설정 -----
/**
 // 함수 정의
 // 함수 호출 시 매개변수 이름 name
 func myFunction(name: String) -> String {
     return "안녕하세요?! \(name) 입니다!"
 }
 
 // 함수 호출 시 매개변수 이름이 myName
 func myFunctionSecond(myName name: String) -> String {
     return "안녕하세요?! \(name) 입니다!"
 }
 
 // 함수 호출 시 매개변수 이름 없음
 func myFunctionThird(_ name: String) -> String {
     return "안녕하세요?! \(name) 입니다!"
 }
 
 print(myFunction(name: "정대리"))
 print(myFunctionSecond(myName: "개발하는 정대리"))
 print(myFunctionThird("개발하는 정대리"))
 */

//MARK: ----- 09 제네릭 -----
/**
 // 친구
 struct Friend {
     var name: String
 }
 
 // 제네릭 <T>
 // 제네릭으로 어떤 자료형이 들어올 수 있도록 설정
 struct MyArray<SomeElement> {
     
     // 맴버변수
     var elements = [SomeElement]()
     
     // 생성자 메소드
     // _ 앞에 언더바를 넣음으로써 매개변수 이름 생략
     init(_ elements: [SomeElement]) {
         self.elements = elements
     }
 }
 
 var myIntegerArray = MyArray([1, 2, 3])
 print("myIntegerArray : \(myIntegerArray)")
 
 var myStringArray = MyArray(["가", "나", "다"])
 print("myStringArray : \(myStringArray)")
 
 let firstFriend = Friend(name: "철수")
 let secondFriend = Friend(name: "영희")
 let thirdFriend = Friend(name: "수잔")
 
 var myFriendsArray = MyArray([firstFriend, secondFriend, thirdFriend])
 print("myFriendsArray: \(myFriendsArray)")
 */

//MARK: ----- 10 클로저 -----
/**
 let myName: String = {
     // 요 부분이 myName으로 들어간다.
     return "정대리"
 }()
print(myName)
 
 var yourName: String {
     return "호호할머니"
 }
 print(yourName)
 
 // 매개변수를 가지고 String 으로 반환하는 클로저
 let myRealNameString = { (name: String) -> String in
     return "개발하는 \(name)"
 }
 print(myRealNameString("쩡대리"))
 
 // 클로저가 print 로직을 담고 있다
 let name = {
     print("정대리")
 }
 name()
 
 // 클로저가 매개변수를 가지며 아래 로직을 담고 있다
 let myRealName = { (name: String) in
     print("개발하는 \(name)")
 }
 myRealName("정대리")
 */

//MARK: ----- 11 매개변수로써 클로저 -----
/**
 // 매개변수로써 클로저
 func sayHi(completion: () -> Void) {
     print("안녕하세요?!")
     sleep(3)
     // 클로저를 실행
     completion()
 }
 
 // 매개변수로서 데이터를 반환하는 클로저
 func sayHiWithName(completion: (String) -> Void) {
     print("안녕하세요?!!?!")
     sleep(3)
     // 클로저를 실행과 동시에 데이터를 반환
     completion("오늘도 빡코딩 하고 계신가요?!")
 }
 
 // 메소드 호출 시 클로저가 실행될 때를 알 수 있다.
 sayHi {
     print("3초가 지났다. 1")
 }
 sayHi {
     print("3초가 지났다. 2")
 }
 sayHi {
     print("3초가 지났다. 3")
 }
 
 sayHiWithName(completion: { (comment: String) in
     print("3초 뒤 그가 말했다. \(comment)")
 })
 sayHiWithName { (comment: String) in
     print("3초 뒤에 그가 또 말했다. \(comment)")
 }
 sayHiWithName { (comment: String) in
     print("3초 뒤에 그가 또또 말했다. \(comment)")
 }
 */

//MARK: ----- 12 객체 생성자 & 해제 메소드 -----
/**
 class Friend {
     var name = "철수"
     // 생성자 메소드 - 객체 생성시 발동
     init() {
         print("친구가 생겼어요! name: \(self.name)")
     }
     // 매개변수를 가지는 생성자 메소드
     init(_ name: String) {
         self.name = name
         print("친구가 생겼어요! name: \(self.name)")
     }
     // 해당 인스턴스 객체가 메모리에서 할당 해제 될 때 발동
     deinit {
         print("친구가 없어졌어요.. name: \(self.name)")
     }
     // deinit 검증을 위해 작성
     var calledTimes = 0
     let MAX_TIMES = 5
     static var instancesOfSelf = [Friend]()
     class func destroySelf(object: Friend) {
         instancesOfSelf = instancesOfSelf.filter{
             $0 !== object
         }
     }
     func call() {
         calledTimes += 1
         print("called \(calledTimes)")
         if calledTimes > MAX_TIMES {
             Friend.destroySelf(object: self)
         }
     }
 }
 
 var myFirstFriend = Friend()
 let mySecondFriend = Friend("영희")
 
 // 인스턴스 메모리에서 해제하기
 weak var selfDestructingObject = Friend("수잔")
 if selfDestructingObject != nil {
     selfDestructingObject!.call()
 } else {
     print("object no longer exists")
 }
 */

//MARK: ----- 13 상속 -----
/**
 class Friend {
     var name: String
     init(_ name: String) {
         self.name = name
     }
     
     func sayHi() {
         print("안녕?! 난 \(self.name) 라고 해")
     }
 }
 
 class BestFriend: Friend {
     // override를 통해 부모클래스의 메소드를 가져온다
     override init(_ name: String) {
         // super 키워드로 부모의 메소드를 사용
         super.init("베프 " + name)
     }
     
     override func sayHi() {
         super.sayHi()
     }
 }
 
 let myFriend = Friend("철수")
 myFriend.sayHi()
 let myBestFriend = BestFriend("영희")
 myBestFriend.sayHi()
 */

//MARK: ----- 14 딕셔너리 -----
/**
 // 키 값으로 한쌍인 딕셔너리 - 사물함과 비슷
 var myFriends = ["BF" : "철수", "highschool" : "영희"]
 
 // BF 라는 열쇠로 내용물을 꺼냄
 if let myBF = myFriends["BF"] {
     print(myBF)
 }
 
 // 값을 꺼낼 때 찬는 키로 저장된 값이 없다면
 // default 값을 가져오도록 설정 가능
 let myFriend = myFriends["hohoBF", default: "친구없음"]
 print(myFriend)
 
 // 값 추가 및 변경 가능
 myFriends["hoho"] = "호호"
 let someValue = myFriends["hoho", default: "친구없음"]
 print(someValue)
 
 // 값 추가 및 변경 가능
 myFriends.updateValue("하", forKey: "hoho")
 let hoho = myFriends["hoho", default: "친구없음"]
 print(hoho)
 
 // 이런식으로 빈 딕셔너리도 생성 가능 (키, 값 자료형)
 let emptyDictionary = [String: Int]()
 let myEmptyDic = Dictionary<String, Int>()
 */

//MARK: ----- 15 파이널 클래스 -----
/**
 // final 키워드로 다른 클래스가 상속받지 못함
 final class Friend {
     var name : String
     init(name: String) {
         self.name = name
     }
 }
 
 // : Friend 로 상속을 하였지만 컴파일 에러가 뜸
 class BestFriend: Friend {
     override init(name: String) {
         super.init(name: "베프" + name)
     }
 }
 
 let myFriend = Friend(name: "철수")
 print("myFriend : \(myFriend.name)")
 
 let myBF = Friend(name: "수잔")
 print("myBF : \(myBF.name)")
 */

//MARK: ----- 16 메소드 매개변수 inout -----
/**
 // 매개변수 name 을 받는 메소드
 // _ 언더바를 넣어 메소드 호출시에 이름 안써도 됨
 func sayName(_ name: String) {
     // 받은 매개변수를 이용해 프린트로 출력
     print("안녕?! 난 \(name) 라고 해")
 }
 
 // 메소드에 매개변수로 들어오는 값은 변경 할 수가 없다
 // 하지만 inout 키워드를 이용하면 값 변경 가능
 func sayYourname(_ name: inout String) {
     name = "개발하는 " + name
     print("안녕?! 난 \(name) 라고 해")
 }
 
 sayName("정대리")
 
 // inout 메소드에 들어가는 값은
 // 변경 가능해야 하기 때문에 메소드에
 // 바로 값을 넣지 못하고
 // 변수에 한번 값을 담은 뒤에 넣을 것
 var name = "정대리"
 
 // inout 매개변수라고 해당 변수 앖에
 // &를 달아서 알려줌
 sayYourname(&name)
 */

//MARK: ----- 17 에러 -----
/**
 // 자료형이 Error인 이넘
 enum MismatchError: Error {
     case nameMismatch
 }
 
 // throw 를 통해 에러를 밖으로 던진다
 // 에러를 밖으로 보낸다고 메소드 반환 부분에 throws
 func guessMyName(name userInput: String) throws {
     // 매개변수로 받은 이름이 정대리와 일치하지 않으면
     if (userInput != "정대리") {
         // 이름 미스매치 에러를 던진다, 보낸다
         throw MismatchError.nameMismatch
     }
 }
 
 // do 가 영문법에서 강조라고 생각 하면 좋음
 // do study, do work hard
 // 에러 잡아?
 // do catch 를 이용해 외부로 던져진? 에러를 잡아
 // 에러 처리가 가능함
 do {
     try guessMyName(name: "이대리")
     print("정답 입니다!")
 } catch {
     // error를 출력해서 에러 확인가능
     print("에러 메시지 : \(error)")
     print("땡! 다음기회에..")
 }
 */

//MARK: ----- 18 struct mutating -----
/**
 // 맴버 변수 name을 가지는 struct
 // struct는 참조인 class와 다르기 때문에
 // struct 구조의 맴버 변수 값을 변경하려면
 // mutating 키워드가 필요
 struct Friend {
     var name: String
     // mutating 키워드로 맴버 변수의
     // 값을 변경하는 메소드
     mutating func changeName() {
         self.name = "hello! " + self.name
     }
 }
 
 var myFriend = Friend(name: "jeff")
 print(myFriend.name)
 myFriend.changeName()
 // 멤버 변수가 변경된 걸 확인 할 수 있다
 print(myFriend.name)
 */

//MARK: ----- 19 콜렉션 Set -----
/**
 // 배열과 비슷한 set
 // 배열처럼 중복으로 값을 넣을 수 없다.
 // 아무리 넣어도 고유한 녀석들만 남음
 var myNumberSet = Set<Int>()
 myNumberSet.insert(1)
 myNumberSet.insert(1)
 myNumberSet.insert(2)
 myNumberSet.insert(3)
 myNumberSet.insert(3)
 
 print("myNumberSet.count : \(myNumberSet.count)")
 
 // 배열과 다르게 순서가 정해져있지 않다.
 // 매번 출력되는 값들의 순서가 다르다
 for item in myNumberSet {
     print("item: \(item)")
 }
 
 // 그 외에도 콜렉션 [배열, 셋, 딕셔너리, 튜플] 등이 가지고 있는 기본 메소드 들을 제공한다.
 var myFriends: Set<String> = ["철수", "영희", "수지"]
 if myFriends.contains("철수") {
     print("내 친구중에 철수가 있다!")
 }
 
 // 영희의 인덱스를 가져와서
 if let indexToRemove = myFriends.firstIndex(of: "영희") {
     // 영희를 셋에서 지운다.
     myFriends.remove(at: indexToRemove)
 }
 
 if !myFriends.contains("영희") {
     print("내 친구중에 영희는 없다..")
 }
 */

//MARK: ----- 20 Struct 메소드 -----
/**
 // struct 에서도 메소드를 가질 수 있고
 // 멤버변수들 활용이 가능하다
 struct Friend {
     
     var lastname: String
     var firstname: String
     
     // 풀네임을 가져오는 메소드
     func getFullname() -> String {
         return lastname + " " + firstname
     }
 }
 
 var myFriend = Friend(lastname: "정", firstname: "대리")
 // 풀네임이 들어오는 걸 확인할 수 있다.
 print(myFriend.getFullname())
 */

//MARK: ----- 21 프로토콜 -----
/**
 // 보통 delegate 패턴의 경우에는 ㅇㅇdelegate
 // 스위프트 언어자체에서는 ㅇㅇing, ㅇㅇable
 // 등으로 프로토콜의 이름을 정함

 // 프로토콜을 통해
 // 맴버변수, 메소드 등을 꼭 구현하도록 강제
 protocol Naming {
     var name: String {get set}
     func getName() -> String
 }
 
 // Naming 프로토콜을 임플레먼트 했기 때문에
 struct Friend: Naming {
     // name 맴버 변수를 설정하지 않으면 에러 발생
     var name: String
     // getName() 메소드 설정 안하면 에러 발생
     func getName() -> String {
         return "내 친구: " + self.name
     }
 }
 
 let myFriend = Friend(name: "철수")
 let name = myFriend.getName()
 print(name)
 */

//MARK: ----- 22 프로토콜 상속 -----
/**
 // 프로토콜 자체는 자신의 인스턴스는 만들지 못한다.
 // 프로토콜을 임플리먼트하면 해당 프로토콜의 변수나, 메소드의 설정이 강제된다.
 // 프로토콜도 상속해서 사용이 가능하다.

 // 이름
 protocol Naming {
     // get set 을 통해 이름을 설정하고 가져올 수 있다.
     var name: String {get set}
     func getName() -> String
 }

 // 나이
 protocol AgeCountable {
     var age: Int {get set}
 }

 // 이름, 나이 프로토콜을 상속하는 친구 프로토콜
 protocol Friendable: Naming, AgeCountable {
     
 }
 
 // 친구 프로토콜을 임플레먼트하는 MyFriend 스트럭트
 struct MyFriend: Friendable {
     var name: String
     var age: Int
     
     func getName() -> String {
         return self.name
     }
 }
 
 var myFriend = MyFriend(name: "철수", age: 19)
 print(myFriend.getName())
 print(myFriend.age)
 */

//MARK: ----- 23 프로토콜 확장(익스텐션) -----
/**
 // 이름관련 프로토콜
 protocol Naming {
     var lastname: String {get set}
     var firstname: String { get set}
     func getName() -> String
 }
 
 // Naming 프로토콜을 임플레먼트하는 스트럭트
 struct Friend: Naming {
     var lastname: String
     var firstname: String
     func getName() -> String {
         return self.firstname
     }
 }
 
 let myFriend = Friend(lastname: "배", firstname: "철수")
 let name = myFriend.getName()
 print("네임 : ", name)
 // Friend 스트럭트에는 없지만
 // 프로토콜 확장을 통해
 // 메소드가 추가된 것을 확인할 수 있음
 let fullname = myFriend.getFullnmae()
 print("풀네임: \(fullname)")
 
 // 익스텐션확장을 통해 프로토콜에 메소드 추가
 extension Naming {
     func getFullnmae() -> String {
         return self.lastname + self.firstname
     }
 }
 */

//MARK: ----- 24 프로토콜 제네릭 associatedtype -----
/**
 // 애완동물 관련 프로토콜
 protocol PetHaving {
     // associatedtype 을 통해
     // 제네릭으로 어떠한 자료형이든 가질 수 있다
     associatedtype T
     var pets:[T] {get set}
     // mutating을 통해 스트럭트에서 멈버 변수 값 변경
     mutating func gotNewPet(newPet: T)
 }

 enum Animal {
     case cat, dog, bird
 }

 // 애완동물 프로토콜을 임플레먼트하는 친구 스트럭트
 struct Friend: PetHaving {
     mutating func gotNewPet(newPet: ViewController.Animal) {}
     
     // 배열의 자료형이 Animal 이넘으로 사용가능
     var pets = [Animal]()
 }

 // 애완동물 프로토콜을 임플레먼트하는 가족 스트럭트
 struct Family: PetHaving {
     mutating func gotNewPet(newPet: String) {}
     
     // 배열의 자료형이 문자열
     var pets = [String]()
 }

 var myFriend = Friend()
 myFriend.getNewPet(newPet: Animal.cat)
 myFriend.getNewPet(newPet: Animal.dog)
 print(myFriend.pets)

 var myFamily = Family()
 myFamily.getNewPet(newPet: "거북이")
 myFamily.getNewPet(newPet: "토끼")
 print(myFamily.pets)

 // 익스텐션으로 프로토콜의 메소드 로직 구성
 extension PetHaving {
     mutating func getNewPet(newPet: T) {
         self.pets.append(newPet)
     }
 }
 */

//MARK: ----- 25 typealias -----
/**
 protocol Naming {
     func getName() -> String
 }

 protocol Aging {
     func getAge() -> Int
 }

 // typealias 별칭을 통해 프로토콜 별명 설정이 가능
 typealias Friendable = Naming & Aging

 struct Friend: Friendable {
     var name: String
     var age: Int
     func getName() -> String {
         return self.name
     }
     func getAge() -> Int {
         return self.age
     }
 }

 // 자료형, 클래스, 스트럭트, 클로저 등
 // 모두 별명 설정이 가능
 typealias FriendName = String
 var friendName: FriendName = "정대리"

 // 친구 배열을 별명으로 설정하였다.
 typealias Friends = [Friend]
 var myFriendsArray = Friends()

 // 클로저를 StringBlock 이라는 별명으로 설정하였다.
 typealias StringBlock = (String) -> Void
 
 sayHi { (result) in
     print("여기서 받음 : ", result)
 }
 
 func sayHi(completion: StringBlock) {
     print("안녕하세요?!")
     completion("오늘도 빡코딩 하고 계신가요?!")
 }
 */

//MARK: ----- 26 lazy -----
/**
 struct Pet {
     init() {
         print("Pet 이 생성 되었다")
     }
 }
 
 // 클래스나 스트럭트 동일하게 적용됩니다.
 struct Friend {
     var name: String
     // 팻을 맴버 변수로 가진다
     // lazy 키워드를 사용하면
     // 인스턴스 생성이 바로 안된다
     lazy var pet = Pet()
     // 생성자 메소드
     init(_ name: String) {
         self.name = name
         print("Friend 가 생성됨")
     }
 }
 
 // lazy 키워드가 없을 때는
 // Friend 가 생성될 때 Pet도 같이 인스턴스 생성이 된다
 var myFriend = Friend("철수")
 
 // lazy 키워드가 있을 때는
 // 나중에 직접 생성 해줘야 생성된다
 myFriend.pet = Pet()
 */

//MARK: ----- 프로퍼티 -----
/**
 // 프로퍼티는 값을 특정 클래스(class), 구조체(struct), 열거형(enum)과 연결합니다.
 // 저장 / 연산 / 타입 프로퍼티
 
 // Stored Property 저장 프로퍼티는 상수, 변수 값을 인스턴스의 일부로 저장 / 클래스와 구조체에서만 사용
 // Computed Property 연산 프로퍼티 / 클래스, 구조체, 열거형에서 사용
 // Type Property 타입 프로퍼티는 프로퍼티를 타입 자체와 연결한 것
 
 // -- Stored Property 저장 프로퍼티 --
 
 // 구조체
 struct FixedLengthRangeS {
     // 변수 저장 프로퍼티
     var firstValue: Int
     // 상수 저장 프로퍼티
     let length: Int
 }
 
 // 클래스
 class FixedLengthRangeC {
     var firstValue: Int
     let length: Int
     
     init(firstValue: Int, length: Int) {
         self.firstValue = firstValue
         self.length = length
     }
 }
 
 // Lazy Stored Properties
 class DataImporter {
     // DataImporter 클래스는 외부파일에서 데이터를 가져오는 클래스!
     var filename = "data.txt"
     // 데이터를 가져올 외부파일이름은 "data.txt" 인가봐요
 }
 
 class DataManager {
     lazy var importer = DataImporter() // lazy 프로퍼티는 항상 변수로서 선언해야 한다. var / let으로 선언한 프로퍼티는 초기화를 함과 동시에 값을 가져야 하기 때문에, lazy 사용 불가, lazy는 값이 필요할 때 초기화함. / lazy로 선언했다고 해도 lazy 프로퍼티가 초기화 되지 않은 상태에서 여러 쓰레드가 동시에 이 lazy 프로퍼티에 액세스 한다면, 이 프로퍼티가 단 한번만 초기화 된다는 것을 보장할 수 없음.
     var data = [String]()
     //  DataManager 클래스는 데이터 관리하는 클래스. importer가 위에서 선언한 DataImporter의 인스턴스이며, lazy로 선언되어 있음
 }
 
 // -- Computed Property 연산 프로퍼티 --
 // getter와 setter를 통해 다른 프로퍼티와 간접적으로 값을 검색하고 세팅
 // 클래스, 구조체, 열거형에 사용된다.
 // var로 선언해야한다.
 // 클래스, 구조체, 열거형에 값을 저장할 저장 프로퍼티가 하나 있어야한다. ==> 연산프로퍼티 자기 자신을 리턴하거나 값을 지정할 수 없다.
 // get, set을 동시에 구현 가능하며, get만 구현하는 것도 가능. 하지만 set만 구현하는 것은 안된다
 // set의 파라미터를 생략할 수 있으며 생략했을 시, newValue라는 키워드를 사용한다.
 
 class Point {
     var tempX: Int = 1
     var x: Int { // 반드시 var로 선언
         get {
             return self.tempX
         }
         set(newValue) {
             self.tempX = newValue * 2
         }
     }
 }
 
 struct PointA {
     var x = 0.0, y = 0.0 // "저장 프로퍼티" 선언
 }
 
 struct SizeA {
     var width = 0.0, height = 0.0
 }
 
 struct Rect {
     
     // 저번에 배운 CGRect와 비슷하다고 생각하시면 됩니다!!
     var origin = PointA() // origin은 x, y 좌표니 Point() 타입으로 만들어주고
     var size = SizeA() // size는 너비와 높이를 가지니 Size() 타입으로 만들어줍니다.
     var center: PointA {
         // center라 함은 어떤 사각형의 가운데인 "좌표"겠죠? 그러니 Point 타입으로 선언해주고!! get과 set이 나오는 것을 보니 center는 "연산 프로퍼티"임을 알 수 있네요.
         get {
             let centerX = origin.x + (size.width / 2)
             let centerY = origin.y + (size.height / 2)
             // get에도 위처럼 새로 변수를 선언하고 값을 할당 할 수 있음. 리턴만 제대로 해주면 됨.
             // 리턴하는 타입은 center의 타입과 반드시 같아야해요. 즉 Point 타입.
             return PointA(x: centerX, y: centerY)
         } set (newCenter) {
             origin.x = newCenter.x - (size.width / 2)
             origin.y = newCenter.y - (size.height / 2)
         }
     }
 }
 
 // Read-Only Computed Properties
 
 struct Cuboid {
     var width = 0.0, height = 0.0, depth = 0.0
     var volume: Double {
         return width * height * depth
     }
 }
 
 // -- Type Property 타입 프로퍼티 --
 
 // 인스턴스 프로퍼티 - 특정 타입의 인스턴스에 속하는 프로퍼티, 특정한 구조체, 클래스에 속하는 저장프로퍼티와 연산프로퍼티가 바로 인스턴스 프로퍼티임
 // 프로퍼티를 '타입 자체'와 연결한 것
 // 타입 프로퍼티는 모든 타입이 사용할 수 있는 상수 프로퍼티(constants property) 또는 글로벌 변수 프로퍼티와 같이 특정 타입의 모든 인스턴스에 공통적인 값을 정의하는 데 유용함
 // '저장 타입 프로퍼티'(stored type property)는 '변수 또는 상수'일 수 있음
 // '연산 타입 프로퍼티'(computed type property)는 Computed instance property와 같이 항상 '변수 프로퍼티'로 선언됨
 
 // 저장 인스턴스 프로퍼티(Stored instance property)와 달리 저장 타입 프로퍼티(Stored type Property)에는 항상 '기본값'(default value)을 줘야한다. 왜냐하면 초기화 시에, 타입 자체에는 저장 타입 프로퍼티(Stored type Property)에 값을 할당할 initializer가 없기 때문
 // 저장 타입 프로퍼티는 처음 엑세스 할때는 '게으르게 초기화'(lazily initialized)한다.
 // 다수의 쓰레드에 의해 동시에 엑세스 되고 있어도, 한번만 초기화되는 것이 보증되어 있어 "lazy"라는 키워드를 사용할 필요는 없다.
 
 // Swift에서 타입 프로퍼티는 타입 정의의 "일부로" 타입의 외부 중괄호 안에 쓰여지며, 각 타입 프로퍼티는 명시적으로 지원하는 타입으로 범위가 지정됨
 
 // static 키워드를 사용하여 타입 프로퍼티 정의
 // 클래스 타입에 대한 연산 타입 프로퍼티(Computed type property)의 경우, "class" 키워드를 사용하여 "class" 키워드를 사용하여 서브클래스가 슈퍼클래스의 구현을 재정의(override)할 수 있습니다.
 // 연산 타입 프로퍼티(Computed type properti)
 struct SomeStructure {
     static var storedTypeProperty = "Some value."
     static var computedTypeProperty: Int { // get, read only
         return 1
     }
 }
 enum SomeEnumeration { // 저장 타입 프로퍼티는 enum(열거형)에서도 사용될 수 있다
     static var storedTypeProperty = "Some value"
     static var computedTypeProperty : Int { // get, read only
         return 6
     }
 }
 // 클래스 타입에 대한 연산 타입 프로퍼티(Computed type property) - override
 class SomeClass {
     static var storedTypeProperty = "Some value."
     static var computedTypeProperty: Int {
         return 27
     }
     class var overrideableComputedTypeProperty: Int {
         return 107
     }
 }
 class ChildSomeClass: SomeClass {
     override static var overrideableComputedTypeProperty: Int {
         return 222
     }
 }
 
 // 타입 프로퍼티 조회와 설정(Querying and Setting Type Properties
 -------------------------------------------------------------
 // -- Stored Property 저장 프로퍼티 --
 
 var rangeOfThreeItemsS = FixedLengthRangeS(firstValue: 0, length: 3) // var 인스턴스, RixedLengthRange() - 초기값이 있다면
 rangeOfThreeItemsS.firstValue = 6
//        rangeOfThreeItems.length = 10
 
 let rangeOfThreeItemsS2 = FixedLengthRangeS(firstValue: 0, length: 3) // 구조체 특성상 let 인스턴스는 (구조체 내의 프로퍼티가 var 이어도) 값이 바뀌지 않는다
//        rangeOfThreeItems2.firstValue = 6
//        rangeOfThreeItems.length = 10
 
 var rangeOfThreeItemsC = FixedLengthRangeC(firstValue: 0, length: 3)
 rangeOfThreeItemsC.firstValue = 3
//        rangeOfThreeItemsC.length = 10
 
 let rangeOfTrheeItemsC2 = FixedLengthRangeC(firstValue: 0, length: 3) // reference type 원본에 바로 접근
 rangeOfTrheeItemsC2.firstValue = 3
//        rangeOfTrheeItemsC2.length = 10
 
 let manager = DataManager() // DataManager의 인스턴스를 만듭니다. 참고로, DataManager의 저장프로퍼티들은 초기값이 있으므로 init이 없어도 됩니다.
 manager.data.append("Some data") // DataManager의 저장프로퍼티 data라는 배열에 어떤 데이터를 집어넣고,
 manager.data.append("Some more data") // 또 집어넣어요.
 // 하지만 importer는 생성되지 않았음
 print(manager.importer.filename)
 
 // -- Computed Property 연산 프로퍼티 --
 
 var p: Point = Point()
 p.x = 12
 
 var square = Rect(origin: PointA(x: 0.0, y: 0.0), size: SizeA(width: 10.0, height: 10.0))
 let initialSquareCenter = square.center
 print(initialSquareCenter)
 square.center = PointA(x: 15.0, y: 15.0)
 print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
 
 // -- Type Property 타입 프로퍼티 --
 
 print(SomeStructure.storedTypeProperty)
 SomeStructure.storedTypeProperty = "Another value."
 print(SomeStructure.storedTypeProperty)
 print(SomeEnumeration.computedTypeProperty)
 print(SomeClass.computedTypeProperty) // 타입 자체와 연결하는 것
 */

//MARK: ----- 27 고차함수(Higher Order Functions) -----
/**
 let resultOne = saySomething(getWords: getMyWords(_:_:), firstInput: "안녕하세요!", lastInput: "개발하는 정대리입니다")
 print("resultOne: \(resultOne)")
 
 let resultTwo = saySomething(getWords: getMyWordsTwice(_:_:), firstInput: "안녕하세요!", lastInput: "개발하는 정대리입니다")
 print("resultTwo: \(resultTwo)")
 
 // 고차함수
 // 매개변수로 함수 혹은 클로저를 받고 받았던 녀석을 반환하는 함수
 // 콜렉션에 들어가는 배열, 딕셔너리, 셋에
 // Stored, Map, Filter, Reduce 등이 빌트인 되어있다.
 
 func getMyWords(_ firstWord: String, _ lastWord: String) -> String {
     return firstWord + " " + lastWord
 }
 
 func getMyWordsTwice(_ firstWord: String, _ lastWord: String) -> String {
     return firstWord + " " + lastWord + " / 한번 더 말할께요! / " + firstWord + " " + lastWord
 }
 
 // 함수 자체를 매개변수로 넣고
 func saySomething(getWords: (_ first: String, _ last: String) -> String, firstInput: String, lastInput: String) -> String {
     // 넣은 함수를 반환
     return getWords(firstInput, lastInput)
 }
 */

//MARK: ----- 28 sort, sorted -----
/**
 var myArray = [1, 4, 3, 2, 5, 9, 7 ,6, 8, 10]
 
 // sorted를 통해 오름차순으로 정렬된 새 콜랙션을 반환함
 var filteredArray = myArray.sorted()
 print("myArray : \(myArray)")
 print("filteredArray : \(filteredArray)")
 
 // 콜렉션 내의 데이터 들을 번갈아 가면서 돌아
 // 반환 값이 true가 나올 때 해당하는 녀석을 넣게 된다. 그래서 내림차순으로 정렬이 된다.
 var descendingArray = myArray.sorted { (someValue:Int, otherValue:Int) -> Bool in
     return someValue > otherValue
 }
 print("descendingArray : \(descendingArray)")
 
 // 클로저 부분 축약 버전
 var myDescendingArray = myArray.sorted(by: {
     return $0 > $1
 })
 print("myDescendingArray : \(myDescendingArray)")
 
 // > 를 통해 보다 간편하게 정렬이 가능하다
 var shortenDescendingArray = myArray.sorted(by: >)
 print("shortenDescendingArray : \(shortenDescendingArray)")
 
 // sort() 메소드를 통해 해당 배열 자체를 정렬한다.
 print("myArray.sort() : \(myArray.sort()), \(myArray)")
 print("myArray.sort(by: >) : \(myArray.sort(by: >)), \(myArray)")
 print("myArray.sort(by: {return $0 < $1}) : \(myArray.sort(by: {return $0 < $1})), \(myArray)")
 print("myArray.sorted { (someValue:Int, otherValue:Int) -> Bool in return someValue > otherValue } : \(myArray.sorted { (someValue:Int, otherValue:Int) -> Bool in return someValue > otherValue })")
 */

//MARK: ----- 29 private(set) -----
/**
 struct MyPet {
     var kind = "고양이"
     // 내부 스트럭트나 클래스 안에서만 값을 설정
     private (set) var name = "찰스"
     // 스트럭트에서 맴버 변수의 값을 변경할때는 메서드에 mutating 넣어줘야 변경가능
     mutating func setName(to petName: String) {
         self.name = petName
     }
 }
 
 var myPet = MyPet()
 print("myPet.kind : ", myPet.kind)
 
 // 외부에서 접근은 가능하지만
 print("myPet.name : ", myPet.name)
 
 // private(set) 이라서 값 변경은 내부에서만 가능
 // 값을 변경 즉 설정 set 하려고 하면 에러
//        myPet.name = "제임스"
 
 // 내부에 잇는 메소드 사용
 // 내부에서는 값 변경이 가능하다
 myPet.setName(to: "레놀드")
 print("myPet.name : ", myPet.name)
 */

//MARK: ----- 30 foreach 문에서 인덱스도 함께 가져오는 방법 -----
/**
 let myFriendsArray = ["철수", "영희", "수잔", "제임스", "마크"]
 
 // foreach 반복문에서
 // enumerated 를 통해
 // 해당하는 녀석의 인덱스를 가져올 수 있습니다.
 // 인덱스, 가져온 아이템
 for (friendIndex, friendItem) in myFriendsArray.enumerated() {
     print("\(friendIndex) : \(friendItem)")
 }
 */

//MARK: ----- 31 고차함수 map -----
/**
 // 맵 고차함수를 통해 콜렉션의 요소를 변형시킬 수 있습니다
 let friendsArray = ["철수", "영희", "수잔", "제임스", "마크"]
 
 // 배열 맵핑
 let myFriends = friendsArray.map{
     "내친구 : " + $0
 }
 print(myFriends)
 
 let myPetDictionary = ["고양이": "야옹", "강아지": "멍멍", "송아지": "음매"]
 // 딕셔너리 맵핑
 let petResult = myPetDictionary.map { (kind, sound) in
     return ("우리집: \(kind)", "울음소리: \(sound)")
 }
 print(petResult)
 
 let numbersSet: Set<Int> = [1, 1, 2, 3, 4, 4, 5]
 
 // 셋 맵핑
 let result = numbersSet.map { (number: Int) -> Int in
     return number * 10
 }
 print("mappedNumbersSet: \(result)")
 
 // 아래와 같은 방식으로 클로저 부분 축약 가능
 let resultOne = numbersSet.map { (number: Int) in
     return number * 10
 }
 let resultTwo = numbersSet.map { (number: Int) in
     number * 10
 }
 let resultThree = numbersSet.map({$0 * 10})
 let resultFour = numbersSet.map{$0 * 10}
 */

//MARK: ----- 32 compactMap(콤팩트맵) -----
/**
 var myArray = ["one", "2", "three", "4"]
 // map은 변형시키는 값으로 nil도 넣지만
 let intArray = myArray.map { (item: String) in
     return Int(item)
 }
 print(intArray)
 
 // compactMap 메소드는
 // 변형시키는 값이 nil 이면
 // 해당 요소를 뺍니다
 let onlyIntArray = myArray.compactMap { (item:String) in
     return Int(item)
 }
 print(onlyIntArray)
 */

//MARK: ----- 33 flatMap -----
/**
 // 콜렉션 안에 콜렉션이 들어있는 형태 2차원
 let myFriends = [["철수"], ["영희"], ["제임스", "본드"], ["스티브", "잡스"], ["개발하는", "정대리"]]
 
 // flatmap을 통해 1차원으로 만들어 줍니다
 // 말그대로 플랫 : 납작하게 눌러줍니다
 let flatMapped = myFriends.flatMap { (item: [String]) in
     return item
 }
 print(flatMapped)
 */

//MARK: ----- 34 class func -----
/**
 class Friend {
     // 일반적인 메소드
     func sayHi() {
         print("안녕?!")
     }
     // 클래스 메소드로 해당 인스턴스가 생성되지 않아도 호출가능
     class func sayBye() {
         print("바이바이~!")
     }
 }
 
 // 일반적인 헝태는 인스턴스 생성해야 해당 메소드 호출이 가능합니다.
 let myFriend = Friend()
 myFriend.sayHi()
 
 // 인스턴스 생성을 하지 않아도
 // 클래스에 바로 접근해서 메소드 호출이 가능합니다.
 Friend.sayBye()
 */

//MARK: ----- 35 딕셔너리를 이용한 그룹핑 -----
/**
 // 커스텀 친구 타입
 enum FriendType {
     case normal, best
 }
 
 // 친구 타입을 맴버 변수로 가지는 친구 스트럭트
 struct Friend {
     var name : String
     var type : FriendType
 }
 
 let first = Friend(name: "철수", type: .normal)
 let second = Friend(name: "영희", type: .best)
 let third = Friend(name: "제임스", type: .best)
 let fourth = Friend(name: "수잔", type: .normal)
 
 var friendsList = [first, second, third, fourth]
 print(friendsList)
 
 // 딕셔너리를 통해 키, 값으로 배열 그룹핑이 가능합니다.
 // 적용 예) 키: 친구타입, 값: 요소 아이템
 let groupedList = Dictionary(grouping: friendsList) { (friend) -> FriendType in
     return friend.type
 }
 
 // 아래와 같이 간단하게 표현 가능
//         let groupedList = Dictionary(grouping: friendsList, by: {$0.type})
 print(groupedList, type(of: groupedList))
 */

//MARK: ----- 36 DI(의존성 주입, Dependency Injection) -----
/**
 // sayHi를 강제하는 토크 프로토콜
 protocol Talk {
     func sayHi()
 }
 
 // 베프, 올드프랜드 토크클래스들은 토크 프로토콜을 임플리먼트
 class BestFriendTalk: Talk {
     func sayHi() {
         print("오호 오늘도 빡코딩 하는중?!")
     }
 }
 
 class OldFriendTalk: Talk {
     func sayHi() {
         print("어이 올만이여~ ")
     }
 }
 
 class KK: Talk {
     func sayHi() {
         print("kk..")
     }
 }
 
 // 친구 클래스
 class Friend {
     // 맴버변수로써 토크를 가진다
     // 외부에서도 주입이 가능하도록 프라이빗으로 안함
     var talk: Talk?
     init() {}
     
     // 생성자 메소드를 통해 토크 주입 가능
     init(talk: Talk) {
         self.talk = talk
     }
     
     // 의존성 주입이 완료된? 토크로 말한다
     func sayHello() {
         talk?.sayHi()
     }
     
     // 의존성 주입 메소드
     func setTalk(talk: Talk) {
         self.talk = talk
     }
 }
 
 // 친구 인스턴스 생성시에 토크를 주입시킴
 let bfTalk = BestFriendTalk()
 let myBestFriend = Friend(talk:  bfTalk)
 myBestFriend.sayHello()
 
 // 친구 인스턴스를 만들고 맴버 변수에 찔러 넣어서 주입함
 let myOldFriendTalk = OldFriendTalk()
 let myOldFriend = Friend()
 myOldFriend.talk = myOldFriendTalk
 myOldFriend.sayHello()
 
 let mO = KK()
 let mOF = Friend()
 mOF.setTalk(talk: mO)
 mOF.sayHello()
 
 // 의존성 주입은 크게 3가지 방법
 // 1. 생성자 메소드로 찔러 넣기
 // 2. 맴버 변수에 직접 찔러 넣기
 // 3. 주입 메소드를 따로 만들어서 찔러넣기 (이건 잘 사용 안하는 것 같음)
 */

//MARK: ----- 37 getter, setter -----
/**
 class Friend {
     var name: String = ""
     // nickname 게터와 세터 설정을 통해
     // 해당 맴버 변수 데이터를 가져올 때
     // 해당 맴버 변수에 값을 설정할 때 로직을 추가할 수 있다
     var nickname: String {
         get {
             return "내 친구: " + name
         }
         set {
             name = newValue + " (내가 지어준 별명)"
         }
     }
 }
 
 let myFriend = Friend()
 myFriend.name = "철수"
 print(myFriend.nickname)
 
 myFriend.nickname = "수철"
 print(myFriend.nickname)
 */

//MARK: ----- 38 코더블(Codable) -----
/**
 let jsonFromServer = """
 {
 "nick_name": "개발하는 정대리",
 "job": "유튜버, 개발자",
 "user_name": "dev_jengdaeri"
 }
 """
 
 // 코더블을 통해 제이슨 데이터를 클래스 혹은 스트럭트 인스턴스로 생성이 가능합니다.
 struct User: Codable {
     var nickname: String
     var job: String
     var myUserName: String
     // 이때는 파싱하는 제이슨의 키와 맴버 변수의 이름이 일치해야 하는데
     // 아래와 같이 코딩키를 이용하여 변경이 가능합니다.
     enum CodingKeys: String, CodingKey {
         case nickname = "nick_name"
         // 제이슨 user_name 키를 myUserName 이라는 이름으로 받겠다고 설정
         case myUserName = "user_name"
         case job
     }
 }
 
 // 제이슨 스트링을 데이타로 만들기
 let jsonData: Data = jsonFromServer.data(using: .utf8)!
 
 do {
     // 제이슨 디코더를 통해 제이슨 데이터로 유저 인스턴스를 생성!
     // try catch 로 에러 처리
     let user = try JSONDecoder().decode(User.self, from: jsonData)
     print("user: \(user)")
 } catch {
     print("에러 발생! \(error.localizedDescription)")
 }
 */

//MARK: ----- 39 매개변수로 클로저를 다수로 가지는 메소드 -----
/**
 func someFunctionWithClosure(completion: () -> Void,
                              secondCompletion: (String) -> Void,
                              thirdCompletion: (Int) -> Void) {
     print("someFunctionWithClosure() called")
     
     completion()
     secondCompletion("두번째 클로저")
     thirdCompletion(3)
 }
 
 // 멀티 트레일링 클로저 사용이 가능
 someFunctionWithClosure {
 } secondCompletion: { print("\($0)")
 } thirdCompletion: { print("\($0)")
 }
 */

//MARK: ----- 40 컨비니언스 생성자(convenience init) -----
/**
 // 친구 클래스
 class Friend {
     var name: String
     var age: Int
     
     // 지정 생성자메소드 designated initializer
     init(name: String) {
         self.name = name
         self.age = 10
     }
     
     // 컨비니언스 이닛을 통해 기존 지정 생성자에
     // 추가적으로 작업이 가능합니다
     convenience init(name: String, age: Int) {
         // !중요 컨비니언스 생성자는 최소 지정 생성자메소드
         // 중 하나를 호출해야 한다
         
         // 지정 생성자 호출
         self.init(name: name)
         
         // 추가적으로 원하는 설정
         self.age = age
     }
 }
 
 let myFriend = Friend(name: "철수")
 print("\(myFriend.name) / \(myFriend.age)")
 
 let bestFriend = Friend(name: "제임스", age: 30)
 print("\(bestFriend.name) / \(bestFriend.age)")
 */

//MARK: ----- 41 객체 생성 관련 디자인 패턴 중 빌더 패턴 -----
/**
 struct Friend {
     var name: String? = ""
     var age: Int? = 0
 }
 
 // 친구 스트럭트를 생성하는 빌더 클래스
 class FriendBuilder {
     // 빌더가 만드는 친구 스트럭트
     private var friend: Friend = Friend()
     public func withName(_ name: String) -> FriendBuilder {
         // 만들고자 하는 녀석을 설정하고
         friend.name = name
         // 빌더 자기 자신을 반환합니다
         // 이를 통해 체인처럼 유연하게 설정이 가능
         return self
     }
     public func withAge(_ age: Int) -> FriendBuilder {
         friend.age = age
         return self
     }
     // 마지막으로 빌더가 만든 녀석을 반환하면서 마무리
     public func build() -> Friend {
         return self.friend
     }
 }
 
 // 디자인 패턴은 크게 3가지로 나뉩니다
 // 객체생성, 행위, 구조
 // 객체생성 중 빌더패턴을 이용해
 // 객체 생성을 유연하게 할 수 있습니다.
 let myFriend = FriendBuilder()
     .withName("철수")
     .withAge(20)
     .build()
 print("myFriend: ", myFriend)
 */

//MARK: ----- 42 콜렉션 합치기 -----
/**
 let myFriends = ["철수", "영희", "수잔"]
 let otherFriends = ["제임스", "존슨", "존시나"]
 
 // + 더하기를 통해 콜렉션을 합칠 수 있음
 let totalFriends = myFriends + otherFriends
 
 print(totalFriends)
 */

//MARK: ----- 43 reduce -----
/**
 struct Friend {
     var name: String
     var age: Int
 }
 
 let myFriends = [Friend(name: "철수", age: 10), Friend(name: "영희", age: 10), Friend(name: "수잔", age: 20)]
 // reduce를 통해 콜렉션으로 하나 값 계산이 가능합니다
 // $0 : 결과 / $1 : 각 아이템
 // 예) 결과 + 친구의 나이 더하기를 콜렉션 갯수만큼 진행
 // 10이 처음 result에 대한 초기값
 let totalAge_00 = myFriends.reduce(10) { (result: Int, nextItem: Friend) -> Int in
     return result + nextItem.age
 }
 // 아래와 같이 축약 표현이 가능하다
 let totalAge_01 = myFriends.reduce(0) { (result: Int, nextItem: Friend) in
     return result + nextItem.age
 }
 let totalAge_02 = myFriends.reduce(0) { (result, nextItem) in
     return result + nextItem.age
 }
 let totalAge_03 = myFriends.reduce(0) { (result, nextItem) in
     result + nextItem.age
 }
 let totalAge_04 = myFriends.reduce(0) {($0 + $1.age)}
 let totalAge_05 = myFriends.reduce(0) { $0 + $1.age }
 
 print(totalAge_00)
 print(totalAge_05)
 */

//MARK: ----- 44 콜렉션 간 변형 -----
/**
 let numbers = [1, 1, 1, 5, 5, 9, 7]
 
 // 콜렉션 간 변형을 통해
 // 유일한 값을 가지는 배열로 변환이 가능하다
 // 배열 -> 셋
 let numberSet = Set(numbers)
 // 셋 -> 배열
 var uniqueNumbers = Array(numberSet)
 uniqueNumbers.sort()
 print(uniqueNumbers)
 */

//MARK: ----- 45 옵셔널체이닝 -----
/**
 struct Friend {
     let nickname: String
     let person: Person?
 }
 struct Person {
     let name: String
     let pet: Pet?
 }
 struct Pet {
     let name: String?
     let kind: String
 }
 let pet = Pet(name: "개냥이", kind: "고양이")
 let person = Person(name: "정대리", pet: pet)
 let friend = Friend(nickname: "빡코더", person: nil)
 
 // 이런식으로 옵셔널이 연쇄적으로 있을 때
 if let person = friend.person {
     if let pet = person.pet {
         if let petName = pet.name {
             print("petName: \(petName)")
         }
     }
 }
 
 // 옵셔널 체이닝
 // 한번만 언래핑하고 나버지는 옵셔널 처리가 가능
 if let petName = friend.person?.pet?.name {
     print("petName: \(petName)")
 } else {
     // person, pet, name 중 하나가 nil이면
     print("팻 이름이 없어요")
 }
 */

//MARK: ----- 46 Equatable -----
/**
 struct PetKind {
     let name: String
 }
 struct Pet {
     let id: String
     let name: String
     let kind: PetKind
 }

 let catKind = PetKind(name: "고양이")
 let dogKind = PetKind(name: "강아지")
 let myPet1 = Pet(id: "01", name: "개냥이", kind: catKind)
 let myPet3 = Pet(id: "01", name: "댕댕이", kind: dogKind)
 let myPet4 = Pet(id: "01", name: "개냥이", kind: catKind)

 if myPet1.id == myPet3.id && myPet1.kind.name == myPet3.kind.name {
     print("두 팻이 같다")
 } else {
     print("두 팻이 다르다")
 }
 // 커스텀 비교연산자
 print(myPet1 == myPet4)

 // Equatable 프로토콜을 통해서 커스텀 비교 연산자를 만들 수 있음
 extension Pet: Equatable {
     public static func == (lhs: Pet, rhs: Pet) -> Bool {
         return lhs.id == rhs.id && lhs.kind.name == rhs.kind.name
     }
 }
 */

//MARK: ----- 47 zip() -----
/**
 let friends = ["영희", "철수", "존슨"]
 let pets = ["야옹이", "댕댕이", "찍찍이"]
 
 // 두 컬렉션을 zip을 이용해서 쌍으로 묶을 수 있습니다
 let zipped = zip(friends, pets)
 
 for item in zipped {
     print("\(item.0) : \(item.1)")
 }
 
 let zippedArray = Array(zip(friends, pets))
 print(zippedArray)
 print(type(of: zippedArray))
 */

//MARK: ----- 48 스태틱 메소드, 파이널 클래스 메소드 -----
/**
 class MyClass {
     // 클래스 메소드는 인스턴스를 생성하지 않고 메소드 호출이 가능한데
     // final class 메소드랑 static class 메소드도 동일 합니다
     class func sayHi() -> String {
         return "안녕?!"
     }
     static func sayHello() -> String {
         return "안녕하세요?!"
     }
     final class func sayHelloFinal() -> String {
         return "호호 안녕하세요?!"
     }
 }

 // 클래스 메소드는 오버라이딩이 가능하지만
 class HahaClass: MyClass {
     override class func sayHi() -> String {
         return "sayHi() HahaClass 에서"
     }
     
     // 스태틱과 파이널 메소드들은 부모클래스 메소드를 오버라이딩 할 수 없음
 //    override static func sayHello() -> String {
 //        return ""
 //    }
 //    override class func sayHelloFinal() -> String {
 //        return ""
 //    }
 }

 print(MyClass.sayHi())
 print(MyClass.sayHello())
 print(MyClass.sayHelloFinal())
 print(HahaClass.sayHi())
 */

//MARK: ----- 49 Range -----
/**
 // 0에서 2까지 - 0, 1, 2
 let myRange = 0...2
 
 // 0에서 2보다 작을때가지 - 0, 1
 let myRange2 = 0..<2
 
 let myArray = ["철수", "영희", "제임스", "수잔"]
 
 // 레인지를 통해 범위 설정이 가능합니다
 print(myArray[myRange])
 
 // ["철수", "영희", "제임스"]
 for index in myRange {
     print(myArray[index])
 }
 
 for index in myRange2 {
     print(myArray[index])
 }
 */

//MARK: ----- 50 open -----
/**
 // open 키워드를 통해 프로젝트 내 어디서든 사용 가능합니다
 // 즉 다른 외부 모듈에서도 상속 및 오버라이드가 가능하도록 합니다
 // 예) 오픈소스 및 외부 라이브러리 구조, 애플 프레임웍 uiviewcontroller 클래스명 Cmd + 클릭 하셔서 들어가시면
 // open 키워드

 open class Utils {
     open class func printHello() {
         print("Hello from utils")
     }
 }

 // 다른 모듈에서 사용가능한 점이 public 키워드와 다르다
 // public은 외부 모듈에서 상속 및 오버라이드가 불가능하다
 public class MyUtils {
     public class func printHello() {
         print("Hello from MyUtils")
     }
 }
 */

//MARK: ----- 51 struct 기본 생성자 -----
/**
 // struct는 클래스와 달리 생성자매소드가 자동 탑제되어 있는데
 struct Youtuber {
     var name: String
 }
 let youtuber = Youtuber(name: "정대리")
 print(youtuber)
 
 // 생성자를 안에서 따로 지정 가능하지만
 struct Friend {
     var name: String
     init() {
         name = "철수"
     }
 }
 let myFriend = Friend()
 print(myFriend)
 
 // 아래와 같이 extension으로 빼서 기본 생성자 지정이 가능합니다
 let myPet = Pet()
 print(myPet)
 let myCat = Pet(name: "개냥이")
 print(myCat)
 
 struct Pet {
     var name: String
 }

 extension Pet {
     init() {
         name = "야옹이"
     }
 }
 */

//MARK: ----- 52 singleton 싱글턴 -----
/**
 // 객체 생성시 싱글턴 패턴으로
 // 한 메모리 공간에 값을 올릴 수 있습니다
 class Pet {
     static var shared = Pet()
     private init() {}
 }
 
 let myPet = Pet.shared
 let myPet2 = Pet.shared
 // xcode 에서 break 걸고
 // 메모리 주소 확인하시면
 // 같은 주소를 가리키고 있을 거예요!
 */

//MARK: ----- 53 toggle -----
/**
 var isIcedCoffee: Bool = false
 print("isIcedCoffee: ", isIcedCoffee)
 
 // toggle을 통해 손쉽게 bool 값을 변경시킬 수 있습니다
 isIcedCoffee.toggle()
 print("토글됨 isIcedCoffee: \(isIcedCoffee)")
 
 isIcedCoffee.toggle()
 print("토글됨 isIcedCoffee: \(isIcedCoffee)")
 */

//MARK: ----- 54 프로토콜 조건적용 -----
/**
 // 이름 관련 프로토콜
 protocol Naming {
     var name: String { get set }
 }

 // 캣과 친구 클래스가 프로토콜을 준수하고 있는 상황
 class Cat: Naming {
     var name: String
     init(name: String) {
         self.name = name
     }
 }

 class Friend: Naming {
     var name: String
     init(_ name: String) {
         self.name = name
     }
 }

 // extension으로 확장 할 때 준수하고 있는 특정 클래스에만
 // 정의가 가능하다 (struct는 안되고 클래스 일 때만 가능)
 extension Naming where Self : Friend {
     func sayName() {
         print("난 \(self.name) 라고 해")
     }
 }

 extension Naming where Self: Cat {
     func sayName() {
         print("\(self.name) : 야옹~")
     }
 }
 
 let myFriend = Friend("철수")
 myFriend.sayName()
 
 let myCat = Cat(name: "개냥이")
 myCat.sayName()
 */

//MARK: ----- 55 자료형 체크 -----
/**
 class Pet { // 애완동물 클래스
     var name : String
     init(name: String) {
         self.name = name
     }
 }
 class Cat: Pet { // Pet 클래스를 상속하는 캣 클래스
     var hair : String
     init(name: String, _ hair: String) {
         self.hair = hair
         super.init(name: name) // 부모 클래스의 생성자 호출
     }
 }
 class Dog: Pet { // Pet 클래스를 상속하는 Dog 클래스
     var kind: String
     init(_ name: String, kind: String) {
         self.kind = kind
         super.init(name: name) // super는 부모 클래스의 것
     }
 }
 
 let myDog = Dog("ㄸㄸㅇ", kind: "치와와")
 let myCat = Cat(name: "개냥이", "짧은 털")
 let myPets: [Pet] = [myDog, myCat]
 
 myPets.forEach { // 콜렉션에 forEach로 반복문 돌리기
     if $0 is Dog { // is 를 통해 해당 객체의 자료형 판별가능
         print("\($0.name) 는 강아지 에요!")
     } else if $0 is Cat { // $0 배열의 아이템 하나하나
         print("\($0.name) 는 고양이 에요!")
     }
 }
 */

//MARK: ----- 56 중첩 타입(nested type) -----
/**
 struct MyPet {
     enum Kind { // 스트럭트안에 enum 타입
         case cat // kind 이넘의 케이스
         case dog
         // 이넘은 value와 name 이라는 변수를 가지고
         var value: String {
             switch self {
             case .cat:
                 return "고양이"
             case .dog:
                 return "강아지"
             }
         }
         var name : String {
             switch self {
             case .cat:
                 return "개냥이"
             case .dog:
                 return "해피"
             }
         }
     }
     let kind: Kind // MyPet 스트럭트가 가지는 Kind 변수
     var description: String { // 값 확인을 위한 변수
         return "우리집 \(kind.value) '\(kind.name)'에요"
     }
 }
 
 let myCat = MyPet(kind: .cat)
 print(myCat.description)
 
 let myDog = MyPet(kind: .dog)
 print(myDog.description)
 */

//MARK: ----- 57 프로토콜 옵셔널 -----
/**
 // 팻 관련 프로토콜
 protocol PetDelegate {
     func sayHello()
     func saySomething()
 }

 // 프로토콜 익스텐션을 통해 메소드를
 // 옵셔널로 설정 할 수 있습니다
 // 즉 준수하지 않아도 됩니다
 extension PetDelegate {
     func saySomething() {
     }
 }

 // PetDelegate를 준수하는 팻 클래스
 // saySomething은 옵셔널이라서 컴파일 에러가 안남
 class Pet: PetDelegate {
     func sayHello() {
         print("야옹~")
     }
 }
 */

//MARK: ----- 58 Set isSubset -----
/**
 // Set 을 통해 배열이 다른 배열을 포함하고 있는지 여부를 체크할 수 있다.
 let myPets = ["개냥이", "댕댕이", "꼬북이", "짹짹이"]
 let favoritePets = ["개냥이", "댕댕이"]
 let friendsPets = ["뚱뚱이", "해피"]
 
 let myPetsSet = Set(myPets)
 let favoritePetsSet = Set(favoritePets)
 let friendsPetsSet = Set(friendsPets)
 
 // Swift 4.2 ~
 let isFavoritePetsInMyPets = favoritePetsSet.isSubset(of: myPetsSet)
 let isFriendsPetsInMyPets = favoritePetsSet.isSubset(of: friendsPetsSet)
 
 print("isFavoritePetsInMyPets : \(isFavoritePetsInMyPets)")
 print("isFriendsPetsInMyPets : \(isFriendsPetsInMyPets)")
 */

//MARK: ----- 59 stride 제네릭 함수 -----
/**
 // stride 를 통해 범위 안에 반복 처리가 가능하다
 // from 시작, to 끝, by 만큼
 for countdown in stride(from: 4, to: 0, by: -1) {
     print("\(countdown)...")
 }

 let numbers = Array(1...10)
 let result = numbers.chunks(3)
 print(result)

 // 배열 익스텐션
 extension Array {
     // 배열을 쪼개는 메소드
     func chunks(_ chunkSize: Int) -> [[Element]] {
         // stride를 통해 범위는 0에서 배열의 총 갯수
         // 나누는 크기 만큼
         return stride(from: 0, to: self.count, by: chunkSize).map {
             // 나누는 크기 만큼의 배열 생성
             Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
         }
     }
 }
 */

//MARK: ----- 60 딕셔너리(dictionary) 반복문 -----
/**
 // 딕셔너리 배열
 let myFriends = [
     "철수": 19,
     "수잔": 23,
     "존슨": 25
 ]
 
 // 딕셔너리 배열 반복 처리가 가능
 // for (키, 값) in 딕셔너리 배열
 for (friend, age) in myFriends {
     print("\(friend)의 나이는 \(age)")
 }
 */

//MARK: ----- 61 Set, union -----
/**
 // 배열
 let myFriends = ["철수", "영희", "수잔", "제시카"]
 
 let yourFriends = ["철수", "수잔", "제니퍼", "존시나"]
 
 // 배열을 set으로 만들기
 let myFriendsSet = Set(myFriends)
 let yourFriendsSet = Set(yourFriends)
 
 // 유니온으로 중복은 제거하고 둘 합치기
 let totalFriends = myFriendsSet.union(yourFriendsSet)
 print(totalFriends)
 */

//MARK: ----- 62 Set, intersection -----
/**
 // 배열
 let myFriends = ["철수", "영희", "수잔", "제시카"]
 let yourFriends = ["철수", "수잔", "제니퍼", "존시나"]
 
 // 배열을 set으로 만들기
 let myFriendsSet = Set(myFriends)
 let yourFriendsSet = Set(yourFriends)
 
 let commonFriends = myFriendsSet.intersection(yourFriendsSet)
 print(commonFriends)
 */

//MARK: ----- 63 Set, symmetricDifference(중복제거) -----
/**
 // 배열
 let myFriends = ["철수", "영희", "수잔", "제시카"]
 let yourFriends = ["철수", "수잔", "제니퍼", "존시나"]
 
 let myFriendsSet = Set(myFriends)
 let yourFriendsSet = Set(yourFriends)
 
 let exceptDuplicateFriends = myFriendsSet.symmetricDifference(yourFriendsSet)
 print(exceptDuplicateFriends)
 */

//MARK: ----- 64 튜플 -----
/**
 // 튜플은 스위프트 콜렉션 중 하나
 // 콜렉션 : 배열, 딕셔너리, 셋, 튜플
 // 튜플은 키와 값으로 이뤄진 묶음
 // (키: 값, 키: 값 ...)
 var myPet = (name: "댕댕이", kind: "강아지", age: 1)
 
 print(myPet.name)
 print(myPet.kind)
 print(myPet.age)
 
 // 요소의 순서로도 접근 가능
 print(myPet.0)
 print(myPet.1)
 print(myPet.2)
 
 // 값 변경
 myPet.name = "개냥이"
 print(myPet.name)
 
 myPet.name = 3 // error
 */

//MARK: ----- 65 메소드 반환 튜플(tuple) -----
/**
 // 메소드의 반환형
 // 매개변수로 숫자 배열을 받고
 // 튜플로 최소, 최대 숫자를 반환하는 메소드
 func minMax(array: [Int]) -> (min: Int, max: Int) {
     var currentMin = array[0]
     var currentMax = array[0]
     for value in array[1..<array.count] {
         if value < currentMin {
             currentMin = value
         } else if value > currentMax {
             currentMax = value
         }
     }
     return (currentMin, currentMax)
 }
 
 // 메소드의 반환형이 튜플 타입
 let myNumbers = [1, 5, 10, 8]
 let result = minMax(array: myNumbers)
 print(result.min)
 print(result.max)
 print(result.0)
 print(result.1)
 */

//MARK: ----- 66 Any 타입 -----
/**
 // Any를 통해 어떠한 자료형도 받을 수 있음
 // 자료형이 Any인 배열
 var things = [Any]()
 
 struct Pet {
     var name: String
     var kind: String
 }
 
 things.append(0)
 things.append(0.0)
 things.append(42)
 things.append(3.14159)
 things.append("안녕하세요?!")
 things.append((3.0, 5.0))
 things.append(Pet(name: "댕댕이", kind: "강아지"))
 // 클로저 함수도 넣을 수 있음
 things.append({ (name: String) -> String in "안녕 친구들?!, \(name)" })
 print(things)
 
 //TODO : Any 타입 Array에 넣은 Closer 꺼내서 쓰는 방법 모름
 // Equatable, 패턴 매칭 연산자 오버로딩
 //TODO : Any 타입 Array에 Closer를 넣을 때 연산 하는 방법..??
 
 // @@ 클로저 - 함수 포인터 개념 - 반대 개념
 let ttt = test { (string) -> String in
     return "\(string)"
 }
 
 things.append(ttt)
 print(things)
 
 print(ttt)
 
 func test(param: (String) -> String) -> String {
     return param("삼") + "입니다."
 }
 */

//MARK: ----- 67 레인지에서 패턴 매칭 연산자 -----
/**
 let statusCode = 403
 
 // 400 - 499 레인지에 status 코드가 포함된다면
 if (400..<500).contains(statusCode) {
     print("이런 들어옴")
 }
 
 // 패턴 매칭 연산자
 if 400..<500 ~= statusCode {
     print("와 들어옴")
 }
 */


//MARK: ----- 68 패턴 매칭 연산자 오버로딩 -----
/**
 // 패턴 ~= 값
 // 패턴매칭 연산자 오버로드로
 // 입맛에 맞게 연산 기능을 추가할 수 있습니다
 if "20" ~= 20 {
     print("글자와 숫자 일치!")
 } else {
     print("글자와 숫자 불일치..")
 }

 // 패턴 매칭 연산자 오버로드
 // 문자 숫자가 일치 되는지 여부 추가!
 func ~= (patter: String, value: Int) -> Bool {
     return patter == "\(value)"
 }
 */

//MARK: ----- 69 while 반복문 -----
/**
 var count = 0
 let max = 5
 // 5보다 작을 때까지 반복한다
 // while 을 통해 특정 조건일 경우에
 // 계속 반복합니다
 while count < max {
     count = count + 1
     print("count : ", count)
 }
 print("10까지 셌다")
 */

//MARK: ----- 70 repeat while 반복문 -----
/**
 var count = 6
 let max = 5
 // 반복
 // 일단 실행
 // 다른 언어에서의 do while 과 비슷
 repeat {
     count = count + 1
     print("count : ", count)
 } while count < max // 5보다 작을 때까지
 print("\(count) 까지 셌다")
 
 // while 문 에서는 조건읆 ㅓㄴ저 보고
 // 들어가기 때문에 로직을 안탑니다
 while count < max {
     count = count + 1
     print("count : ", count)
 }
 */

//MARK: ----- 71 get 컴퓨티드 프로퍼티 -----
/**
 class Sword { // 공격할 때 마다 내구도가 감소하는 무기 클래스
     var durability = 100 // 내구도
     // 무기의 내구도에 따라 가져올 때 (get) 값이 변하는 변수
     var itemInfo: String { // 아이템 설명
         get {
             switch durability {
             case 50...100:
                 return "음 ~ 아주 명검이야 후후후"
             case 10...50:
                 return "아직 쓸만 하군"
             default:
                 return "더 이상 쓸 것이 못된다.. ㅠ"
             }
         }
     }
     
    // 무기 사용으로 내구도가 감소하는 메소드
     func attackedMonster() {
         self.durability = self.durability - 40
     }
 }
 
 let mySword = Sword()
 mySword.attackedMonster()
 print(mySword.itemInfo, ", 수치 : ", mySword.durability)
 
 mySword.attackedMonster()
 print(mySword.itemInfo, ", 수치 : ", mySword.durability)
 
 mySword.attackedMonster()
 print(mySword.itemInfo, ", 수치 : ", mySword.durability)
 */

//MARK: ----- 72 튜플 사용 -----
/**
 // 튜플도 스위치에서 사용 가능
 // x, y축 위치를 나타내는 somePoint 튜플
 let somePoint = (x: 0, y: 1)
 
 switch somePoint {
 case (x:0, y: 0):
     print("\(somePoint)는 중심에 있다")
 case (_, 0):
     print("\(somePoint)는 x측에 있다")
 case (0, _):
     print("\(somePoint)는 y축에 있다")
 case (-2...2, -2...2):
     print("\(somePoint)는 상자 안에 있다")
 default:
     print("\(somePoint)는 상자 밖에 있다")
 }
 */

//MARK: ----- 73 enum 타입에서 CaseIterable 프로토콜 -----
/**
 // CaseIterable 프로토콜
 // 이넘 타입도 콜렉션처럼 사용할 수 있음
 enum Pet: String, CaseIterable {
     case cat = "고양이"
     case dog = "강아지"
     case trueBird = "참새"
 }
 
 // allCases를 통해
 // 이넘의 타입들을 콜렉션으로 가져옵니다
 let petKindsCount = Pet.allCases.count
 print("애완동물 종류수: \(petKindsCount)")
 
 // 반복문도 가능합니다
 for petTypeItem in Pet.allCases {
     print(petTypeItem.rawValue)
 }
 */

//MARK: ----- 74 protocol 프로토콜 01 - [xib 파일로 커스텀뷰 인스턴스 생성] -----
/**
 // 프로토콜 응용 - // xib 파일로 커스텀뷰를 가져오기
 /// nib 파일로 커스텀뷰를 가져오는 프로토콜
 protocol CustomViewNibbed {
     // 생성하는 스태틱 메소드 선언 -> 자기 자신을 반환
     static func instantiate() -> Self
 }

 /// 확장으로 프로토콜 메소드 정의
 extension CustomViewNibbed where Self: UIView {
     // 스태틱 메소드로 객체 인스턴스를 생성하지 않아도 호출 가능
     static func instantiate() -> Self {
         // 클래스 이름 문자열로 가져오기
         let className = String(describing: self)
         // 해당 클래스 이름의 닙파일 가져오기
         let loadedNib = Bundle.main.loadNibNamed(className,
                                                  owner: self,
                                                  options: nil)
         // 닙 파일에서 자기 자신인 뷰를 가져오기
         let customView = loadedNib?.first as! Self
         return customView
     }
 }

 /// 커스텀뷰 - CustomViewNibbed 프로토콜을 준수한다고 설정
 class MyCustomView: UIView, CustomViewNibbed {}

 // 간편하게 뷰 인스턴스를 가져올 수 있습니다
 let myCustomView = MyCustomView.instantiate()
 */

//MARK: ----- 75 enum with associated value (값을 동반한 enum) -----
/**
 // 애완동물 행동 이넘
 enum PetAction {
     case sleep // 잠자기
     case tailWagging // 꼬리 흔들기
     // 이넘에 값을 넣을 수도 있습니다
     case move(distance: Float) // 움직임
 }
 
 func doAction(_ action: PetAction) {
     switch action {
     case .sleep:
         print("댕댕이가 자고 있다")
     case .tailWagging:
         print("댕댕이가 꼬리를 흔들고 있다")
     case .move(let distance):
         print("댕댕이가 \(distance)만큼 움직였다")
     }
 }
 
 doAction(.sleep)
 doAction(.tailWagging)
 doAction(.move(distance: 3.3))
 doAction(.move(distance: 0.5))
 */

//MARK: ----- 76 case let 옵셔널 패턴 -----
/**
 let friends: [String?] = [nil, "철수", "수잔", nil, "데이빗"]
 
 // case let을 활용해서
 // 콜렉션에 값이 잇는 녀석들만 가져올 수 있습니다
 for case let friend? in friends {
     print("친구를 찾았다 : \(friend)")
 }
 */


//MARK: ----- 77 Any 타입 배열 스위치문 처리 -----
/**
 var things = [Any?]()
 
 struct Pet { var name : String }
 struct Friend { var name: String }
 
 things.append(0)
 things.append(42)
 things.append(Friend(name: "광식이"))
 things.append(Friend(name: "횽식이"))
 things.append("hello")
 things.append((3.0, 5.0))
 things.append(Pet(name: "댕댕이"))
 things.append({(name: String) -> String in "난 \(name)라고 해!"})
 
 // any 타입의 배열을 스위치 문으로 처리 가능합니다
 for thing in things {
     switch thing {
     case 0 as Int:
         print("0이 들어왔다")
     case let someInt as Int where someInt > 10:
         print("someInt \(someInt)는 10 보다 크다")
     case is Friend: // 자료형이 친구라면
         print("들어온 게 친구 이다")
     case let someString as String:
         print("a string value of \"\(someString)\"")
     case let (x, y) as (Double, Double):
         print("an (x, y) point at \(x), \(y)")
     case let myDog as Pet:
         print("우리집 강아지 : \(myDog.name)")
     case let sayHi as (String) -> String:
         print(sayHi("세바스찬"))
     default:
         print("디폴트")
     }
 }
 
 for name in things {
     if let ww = name as? (String) -> String {
         print(ww("옵셔널, 바인딩"))
     }
 }
 */

//MARK: ----- 78 defer -----
/**
 // defer 미루다
 // defer를 이용해 코드블록(스코프)
 // 마지막에 원하는 처리가 가능하다
 func say() {
     print("하나")
     defer {
         // 현재 say 메소드 안에서
         // 제일 마지막에 실행됩니다
         print("이라고 말했다")
     }
     print("둘")
     print("셋")
 }
 
 say()
 */

//MARK: ----- 79 콜렉션 allSatisfy -----
/**
 let names = ["철수", "영희", "존슨"]
 // allSatisfy를 통해 콜렉션 안 요소들이
 // 모두 같은 조건에 부합하는지 확인이 가능합니다
 
 var nameCountAtLeastTwo = names.allSatisfy { (name: String) -> Bool in
     name.count <= 2
 }
 
 print("nameCountAtLeastTwo: ", nameCountAtLeastTwo)
 
 let foreignNames = ["제시", "제임스", "맥"]
 nameCountAtLeastTwo = foreignNames.allSatisfy({ $0.count <= 2
 })
 print("nameCountAtLeasttwo : ", nameCountAtLeastTwo)
 */

//MARK: ----- 80 rawValue로 enum 가져오기 -----
/**
 enum PetType: String { // 애완동물 enum type
     case dog = "강아지"
     case cat = "고양이"
     case none
     // Enum 에 생성자를 두어 rawValue로 이넘타입을 가져올 수 있다
     init(value: String) {
         switch value {
         case "강아지": self = .dog
         case "고양이": self = .cat
         default:
             self = .none
         }
     }
 }
 
 // RawValue로 enum 생성!
 let petType = PetType(rawValue: "강아지")
 switch petType {
 case .dog:
     print("강아지 입니다 ")
 case .cat:
     print("고양이 입니다 ")
 default:
     print("알 수 없음 ")
 }
 */

//MARK: ----- 81 .some, .none -----
/**
 let friends: [String?] = ["철수", nil, nil, "영희"]
 // case let 을 통해 값이 비어있는지 여부를 알 수 있습니다
 // 데이터가 있다면 .some
 for case let .some(aFriend) in friends {
     print(aFriend)
 }
 // 데이터가 없다면 즉 nil 이라면 .none
 for case let .none in friends {
     print("친구가 없다 ")
 }
 
 for (index, aFriend) in friends.enumerated() {
     switch aFriend {
     case let (.some(aFriend)):
         print("index: \(index), aFriend: \(aFriend)")
     case let (.none):
         print("index: \(index), 친구가 없다")
     }
 }
 */

//MARK: ----- 82 case let 변수? -----
/**
 let friends: [String?] = ["철수", nil, nil, "영희"]
 
 // case let 변수? dhqtusjf vytlfh
 // 값이 있을 때만 가져올 수 있습니다
 // case let .some(변수) 와 동일 합니다
 for case let aFriend? in friends {
     print(aFriend)
 }
 */

//MARK: ----- 83 팩토리 메소드 -----
/**
 enum SectionType: String {
     case favorite = "즐겨찾기"
     case popular = "인기"
     case recommend = "추천"
 }
 
 struct Feed {
     var title: String
     var content: String
 }
 
 // 자기 자신의 객체를 만들 때
 // 각 타입을 지정해주는 팩토리 메소드를 만들면 객체 생성시에 간편합니다.
 struct MainSection {
     let feeds: [Feed]
     let type: SectionType
     
     // 타입을 즐겨찾기로 정하고 자기 자신의 객체를 만든다.
     static func favorites(feeds: [Feed]) -> MainSection {
         return MainSection(feeds: feeds, type: .favorite)
     }
     
     static func popular(feeds: [Feed]) -> MainSection {
         return MainSection(feeds: feeds, type: .popular)
     }
     
     static func recommended(feeds: [Feed]) -> MainSection {
         return MainSection(feeds: feeds, type: .recommend)
     }
 }
 */

//MARK: ----- 84 shuffle() -----
/**
 var myPets = ["개냥이", "똘똘이", "댕댕이", "해피"]
 print("myPets: \(myPets)")
 
 // shuffle을 통해 콜렉션 자신의 요소값들을 섞을 수 있습니다.
 myPets.shuffle()
 
 print("myPets: \(myPets)")
 
 // shuffled() 메소드는 섞여진 콜렉션을 반환합니다
 let shuffledPets = myPets.shuffled()
 
 print("shuffledPets: \(shuffledPets)")
 */

//MARK: ----- 85 enum switch where -----
/**
 enum Food { // 음식 enum type
     case delicious(value: Int)
     case sweet
     case solty
 }
 
 // enum 타입에 매개변수를 넣고 그 정도에 따라
 // switch 문에서 where 로 분기처리가 가능합니다
 let homeMeal = Food.delicious(value: 20)
 switch homeMeal {
 case .delicious(let value) where value == 0:
     print(" 음식이 너무 맛없다 ~")
 // 1... 50 사이에 포함되면
 case .delicious(let value) where (1...50).contains(value):
     print("음식이 먹을만 하다 ")
 case .solty:
     print("애미야~ 국이 짜다 ~")
 case .sweet:
     print("아주 달달 하군 ")
 default:
     print("아무맛도 나지 않는다 ")
 }
 */

//MARK: ----- 86 map() -----
/**
 enum AgeType: String {
     case young = "애기"
     case old = "아자씨"
 }
 
 let ages = [13, 22, 36, 47]
 
 // Map을 통해 원하는 자료형으로 변형이 가능합니다
 // 매치 오퍼레이터, 조건 등 여러가지 처리가 가능합니다
 // 반환되는 자료형으로 요소가 변형되어 나가게됩니다
 let ageTypes1 = ages.map { 0...20 ~= $0 ? AgeType.young : AgeType.old}
 let ageTypes2 = ages.map { (0...20).contains($0) ? AgeType.young : AgeType.old}
 
 ageTypes1.forEach { print("\($0.rawValue)")}
 */

//MARK: ----- UIKit GCD - GrandCentralDispatch -----
/**
 // -async(비동기) / sync(동기)
 
 // 쓰레드는 일하는 사람
 // 메인쓰레드는 UI 쓰레드
 // 사용자가 보는 화면 및 터치에 관한 것
 // - main
 DispatchQueue.main.async {
     print("메인 이지롱")
 }
 
 // 백그라운드는 사용자 눈에 보이지 않는 파일 다운로드
 // 혹은 연산 처리가 많이 들어가는 부분에 많이 사용 됩니다
 // - global()
 DispatchQueue.global().async {
     print("백 그라운드지롱!")
 }
 
 // performSelector 를 통해 GCD를 실행할 수 있습니다
 // inBackground 백그라운드에서 돌리기
 performSelector(inBackground: #selector(doSomething), with: nil)
 // onMainThread 메인에서 돌리기
 performSelector(onMainThread: #selector(doSomething), with: nil, waitUntilDone: false)
 
 @objc fileprivate func doSomething() {
     print("haha")
 }
 */

//MARK: ----- UIKit GCD - DispatchGroup -----
/**
 // 큐를 그룹지어 관리할 수 있는 디스패치 그룹
 let myDispatchGroup = DispatchGroup.init()
 // 큐에 각각 라벨을 달 수 있습니다
 let firstQueue = DispatchQueue(label: "com.you.project.firstwork")
 let secondQueue = DispatchQueue(label: "come.you.project.secondwork")
 myDispatchGroup.enter() // 큐가 일 시작 하기전에 그룹 문을 열고 들어갑니다
 firstQueue.async {
     print("내가 1빠!")
     myDispatchGroup.leave() // 할 일이 끝나면 문을 열고 나갑니다
 }
 myDispatchGroup.enter()
 secondQueue.asyncAfter(deadline: .now() + 2) {
     print("내가 2빠!!")
     myDispatchGroup.leave()
 }
 // notify를 통해 그룹 안에 모든 일이 끝났음을 알려줍니다
 myDispatchGroup.notify(queue: DispatchQueue.main) {
     print("모든 큐 끝~~")
 }
 
 // 큐를 그룹지어 관리할수 있는 디스패치 그룹
 let myDispatchGroup2 = DispatchGroup()
 
 let firstWorkQueue = DispatchQueue(label: "com.you.yourproject.firstwork")
 let secondWorkQueue = DispatchQueue(label: "com.you.yourproject.secondwork")
 // 이렇게 큐를 돌릴 때 묶어서 처리하길 원하는 디스패치 그룹을 넣어 줄 수 있습니다
 firstWorkQueue.async(group: myDispatchGroup2) {
     print("firstWorkQueue")
 }
 secondWorkQueue.async(group: myDispatchGroup2) {
     print("secondWorkQueue")
 }
 
 // notify를 통해 그룹 안에 모든 일이 끝났음을 알려줍니다
 myDispatchGroup2.notify(queue: DispatchQueue.main) {
     print("done")
 }
 */

//MARK: ----- UIKit 재귀함수를 활용한 최상단 뷰컨트롤러 가져오기 -----
/**
 class SomeClass {
     // 이제 뷰컨트롤러가 아닌 클래스에서도 최상단 뷰컨트롤러를 찾을 수 있습니다.
     func doSomethingWithTopVC() {
         guard let topViewController = UIApplication.shared.topViewController() else { return }
         topViewController.view.backgroundColor = .yellow
     }
 }

 extension UIApplication {
     func topViewController() -> UIViewController? {
         // 애플리케이션에서 키윈도우로 제일 아래 뷰컨트롤러를 찾고
         // 해당 뷰컨트롤러를 기점으로 최상단의 뷰컨트롤러를 찾아서 반환
         return UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController?.topViewController()
         
     }
 }

 extension UIViewController {
     func topViewController() -> UIViewController {
         // 프리젠트 방식의 뷰컨트롤러가 있다면
         if let presented = self.presentedViewController {
             return presented.topViewController()
         }
         // 자기 자신이 네비게이션 컨트롤러라면
         if let navigation = self as? UINavigationController {
             // 네비게이션 컨트롤러에서 보이는 컨트롤러에서 재귀 (자신의 메소드를 실행)
             return navigation.visibleViewController?.topViewController() ?? navigation
         }
         // 최상단이 탭바 컨트롤러 라면
         if let tab = self as? UITabBarController {
             // 선택된 뷰컨트롤러에서 재귀 (자신의 메소드를 실행)
             return tab.selectedViewController?.topViewController() ?? tab
         }
         // 재귀를 타다가 최상단 뷰컨트롤러를 반환
         return self
     }
 }
 */

//MARK: ----- weak self / strongSelf -----
/**
 컴플레션 클로저를 사용하다 보면 강한 참조에 의한 리테인 사이클을 예방하기 위해
 컴플레션 들어오는 부분에 [weak self] 로 약한참조를 만드는 데요
 만약 여기서 맴버 변수등에 접근하려면 또 self를 붙여야 하는데
 이때 약한참조로 되어 있기 때문에 self 를 언랩핑하는 코드가 들어가게 됩니다.

 이게 상당히 귀찮은데요

 이러한 보일러 템플릿을 프로토콜로 제거하는 방법에 대해 한번 알아보았습니다.

 참조한 영상은 링크 걸어둘테니 좀 더 깊이 알고 싶은 분은 영상으로 보시면 좋을거 같습니다!
 https://youtu.be/BGzPK7f13RM

 정대리 소스 
 https://gist.github.com/TuenTuenna/fd20da8a319cbf4fac06f59e882c8bbf
 
 // 클래스만이 클로저에서 강한참조가 가능하기 때문에 클래스 프로토콜로 설정
 protocol Weakifying: class {}

 // NSObject가 Weakifying 프로토콜을 준수한다고 확장시키기
 // 이를 통해 모든 것이 Weakifying 프로토콜이 적용된 효과
 extension NSObject: Weakifying {}

 // Weakifying 메소드를 확장으로 정의
 extension Weakifying {
     // 약한 참조로 만드는 메소드
     // Self 자기 자신의 인스턴스
     // 제네릭으로 사용가능하도록 제네릭 매개변수 설정 <T>
     // 매개변수로 받는건 (Self, T) -> Void 이지만
     // 반환 할때는 제네릭 데이터만 반환
     func weakify<T>(_ logic: @escaping (Self, T) -> Void) -> (T) -> Void {
         return {
             // weak self 약한참조 처리는 메소드 안에서 처리
             [weak self] data in
             guard let self = self else {return}
             // 호출부에서 사용할 logic
             logic(self, data)
         }
     }
 }

 // 적용 전
 /**
  doSomething(with: { [weak self] result in
  guard let self = self else { return }
  self.someLabel.text = result
  })
  */
 // 적용 후
 /**
  doSomething(with: weakify{ strongSelf, result in
  strongSelf.someLabel.text = result
  */
 */
