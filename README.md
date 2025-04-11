# 🍶 주류 키오스크 앱 - 터치 더 주(Touch the 酒)
<div align="center">
<img src = "https://github.com/user-attachments/assets/863cac12-8e5f-4f1a-b7f6-2d9d630143ca" width=300>
</div>

## 📋 프로젝트 개요
### `터치 더 주(Touch the 酒)`는 주류 키오스크 앱 입니다.
>**터치더주 (Touch the 酒)**<br>
→ 영어와 한자를 섞은 말장난!<br>
⤷ "술(酒, 주)을 터치해!" 키오스크 느낌.
- 프로젝트 명 : 터치 더 주
- 프로젝트 기간 : 2025.04.07 ~ 2025.04.11
- 팀 명 : 1精進(정진)

---

## 🫂 1정진 팀 소개
> **精進(정진: 정성스럽게 한 걸음씩 나아가다)** 라는 의미로<br>
> 매일매일 한 걸음 씩 **정진**하자는 의미를 담아 <ins>**1정진**</ins> 이라는 팀명을 사용하게 되었습니다.

|이름|👑 2정진|최규현|명노훈|
|---|---|---|---|
|<div align="center">직책</div>|<div align="center">👑 Leader</div>|<div align="center">👤 Member</div>|<div align="center">👤 Member</div>|
|<div align="center">역할</div>|- 상단 앱 타이틀 구현<br>- 카테고리 바 구현|- 메뉴 선택 화면 구현<br>- 주문하기 취소하기 버튼 구현|- 장바구니 화면 구현<br>- 총 금액 화면 구현|
|<div align="center">Github</div>| <div align="center">[lemonisgreen](https://github.com/lemonisgreen)</div> | <div align="center"> [ghnn-n](https://github.com/ghnn-n)</div> | <div align="center">[mnh4140](https://github.com/mnh4140)</div>|

---

## 🛠️ 기술 스택
- Language : Swift
- IDE : Xcode
- UI 구현 : UIKit
- UI 디자인 : Figma
- 디자인 패턴 : Delegate 패턴
- 형상 관리 : Github
- 스크럼 및 마일스톤 : Notion
- 커뮤니케이션 : ZEP

## 🎨 와이어 프레임
![image](https://github.com/user-attachments/assets/ed9a60c7-e483-47eb-a0ca-2117791afe3f)

---

## 📱 주요 기능
### 1. 메뉴 카테고리 선택
- 전통주, 사케, 와인 카테고리 존재
- 카테고리 선택 시, 해당 카테고리 상품을 보여줌
### 2. 메뉴 선택 및 장바구니 담기
- 선택한 메뉴가 장바구니에 담김
- 담긴 상품의 수량과 가격이 표시됨
### 3. 장바구니 수량 증가 및 감소
- 장바구니에 담긴 상품을 `-`버튼과 `+`버튼으로 수향 조절 가능
- 수량이 `1` 상태에서 `-`버튼 탭 하면 상품이 삭제됨
### 4. 상품 수량 증가/감소에 따라 결제 금액 변경
- 상품 수량을 조절 시, 수량에 맞게 결제 금액이 실시간으로 반영됨
### 5. `주문하기`, `취소하기` 버튼
- `주문하기` 버튼을 탭하면 해당 상품을 주문 할 것인지 묻는 알리창을 띄움
- `취소하기` 버튼을 탭하면 주문을 취소할 것인지 묻는 알림창을 띄움
- 장바구니가 비어있을때 버튼을 탭하면 장바구니가 비었다는 알림창을 띄움

---

## 📋 커밋 컨벤션 (PR 시 동일하게 적용)
- Commit Message 규칙
  - 💡 [Issue 종류] #Issue 번호 - 한 줄 정리
    - 예시) [Feat] #22 - 탭바 추가

---

## 📌 브렌치 룰 & 전략
- 브랜치 전략
    - github flow를 따르되, main과 개인 작업 브랜치 사이에 Develop를 만들어서 좀 더 안전하게 공동작업을 보호.
        - main: Develop 브랜치에서 하나의 Issue에 생성된 브랜치가 안전하게 머지 되었을 때 푸시
        - Develop: 새로운 Issue가 완료되었을 때 푸시 앤 머지
        - Issue 할당 브랜치: 개인 작업용
        
- 브랜치 룰
    - **`Block force pushes` : Force push 방지**
    - **`require approval of the most recent reviewable push` : 푸시한 사람 외의 누군가의 승인을 받게 강제합니다.**
        - main과 Dev 브랜치에 적용해 모든 팀원의 Approve가 있어야 merge 가능하게 만들고,  Force push를 금지해 Main과 Dev 브랜치를 보호합니다.
        
- 브랜치 네이밍
    - 이슈 종류/#이슈 번호
 
---

## 📦 설치 및 실행 방법
- 이 저장소를 클론
  ```bash
  git clone https://github.com/mnh4140/sparta-bootcamp-iOS-Calculator.git
  ```
- Xcode로 프로젝트 파일을 실행 후 빌드!
