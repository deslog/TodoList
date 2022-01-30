# TodoList

## 투 두 리스트 만들기
## 완성된 화면 


##기능 상세
  * TableView에 할 일은 추가할 수 있다.
  * TableView에서 할 일을 삭제할 수 있다. (스와이프해서 delete)
  * TableView에서 할 일을 재정렬 할 수 있다.
  * 할 일들을 데이터 저장소에 저장하여 앱을 재실행하여도 데이터의 순서, 수정내역 등이 유지된다.
  
## 활용 기술
### UITableView
  * 할 일을 표현해주는 화면을 구현할 수 있는 프레임워크
  * 데이터를 목록 형태로 보여 줄 수 있는 가장 기본적인 UI 컴포넌트
  * UIScrollView를 상속받고 있어서 스크롤 또한 가능하여 리스트 형태로 많은 정보를 보여줄 수 있다.
  * 아이폰의 연락처, 설정 앱이 tableView로 구현되어있다.
#### UITableView 특징
  * 여러개의 cell을 가지고 있고 하나의 열과 여러 줄을 행을 지니고 있어서, 수직으로만 스크롤 가능하다.
  * 섹션을 이용하여 행을 그룹화하고, 콘텐츠를 더 쉽게 탐색할 수 있게한다.
    * 아이폰의 설정앱과 같이, 비슷한 기능을 그룹으로 묶어서 쉽게 구상할 수 있다는 뜻이다.
    * 아이폰의 연락처앱과 같이, 알파벳으로 그룹화도 가능하다.
  * 섹션의 헤더와 푸터에 view를 구성하여 추가적인 정보를 표시할 수 있다. 
  
  
#### DataSource / Delegate 란?
TableView를 사용하기 위해서는 uiTableView datasource와 UITableView delegate 프로토콜을 채택하여 구현해줘야한다.
  ##### DataSource
  데이터를 받아 뷰를 그러주는 역할이다. 총 섹션이 몇개인지, 섹션의 행은 몇개인지, 행에 어떤 정보를 표시할건지 정의할 수 있다.
  ##### delegate
  테이블뷰의 동작과 외관을 담당한다. 뷰가 변경되는 사항을 델리게이트가 담당한다. 그러면 뷰가 델리게이트에 의존하여 뷰를 업데이트 해준다. 행의높이, 행을 선택하면 어떤 액션을 취할건지 정할 수 있다.
  👉🏻 따라서 테이블뷰는 데이터소스와 델리게이트의 정의에 따라 테이블뷰를 사용자에게 어떻게 보여줄건지 정의한다.
    
#### UITableViewDataSource
UITableViewDataSource는 테이블 뷰를 정의하고 수정하는데 필요한 정보를 테이블 뷰 객체에 제공한다. 프로토콜에 정의되어있는 메서드는 아래 사진을 보자.
(사진)
옵셔널로 선언이 안된 두 가지의 메서드가 있는데, 이 메서드들은 다 필수로 채워주어야 한다.
메서드를 살펴보자. (사진에도 주석으로 달려있다.)
  * numberOfRowsInSection : 각섹션에 표기할 행의 갯수, int타입으로 행의 갯수를 반환하면, 테이블뷰에 행이 그만큼 표시된다 (필수로 구현해야할 메서드이다.)
  * cellForRowAt : 특정 인덱스 로우에 셀에 대한 인덱스 정보를 넣어 셀을 반환하는 메서드이다. (필수로 구현해야할 메서드이다.)
  * numberOfSections : 총 섹션의 갯수
  * titleForHeaderInSection / titleForFooterInSection : 특정한 섹션의 헤더, 푸터 타이틀에 반환될 문자열을 묻는 메서드.
  * canEditRowAt : 특정위치의 행이 수정이 가능한지?묻는 메서드. (true를 반환하면, 특정 셀에 스와이프 메뉴를 사용할 수있다.)
  * sectionIndexTitles : 테이블 뷰 섹션 인덱스 타이틀을 묻는 메서드. 문자열 배열을 반환하면 아이폰 기본 연락처 앱처럼 오른쪽 초성과 알파벳으로 색인할 수 있는 뷰가 표현된다.
  * sectionForSectionIndexTitle : 인덱스에 해당하는 섹션을 알려주는 메서드. 아이폰 기본연락처앱에서 초성과 알파벳으로 구성된 인덱스를 선택하면, 인덱스중 몇번째가 눌렸는지 알려준다.

#### UITableViewDelegate
테이블 뷰의 시각적인 부분을 설정하고, 행의 액션 관리, 액세서리 뷰 지원 그리고 테이블 뷰의 개별 행 편집을 도와준다. 해당 프로토콜은 필수로 구현해야할 메서드는 없다.


    
### UIAlertController
  * 앱의 알럿을 표시할때 사용하는 프레임워크
### UserDefaults
  데이터가 로컬에 저장되게 하는 프레임워크
