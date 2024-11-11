# JSP CRUD Project

이 프로젝트는 JSP(JavaServer Pages)를 사용하여 간단한 게시판 CRUD(Create, Read, Update, Delete) 기능을 구현한 웹 애플리케이션입니다. 데이터베이스를 사용하지 않고 Mock 데이터를 사용하여 웹 페이지의 내용을 생성하고, 게시글을 작성하고 수정하고 삭제할 수 있는 기능을 제공합니다.

## 프로젝트 구성

### 주요 파일 구조

- **`index.jsp`**: 프로젝트의 메인 페이지. 전체 웹 페이지의 레이아웃을 구성합니다.
- **`board.jsp`**: 게시판 목록 페이지. 모든 게시글을 표시합니다.
- **`write.jsp`**: 새로운 게시글을 작성하는 폼 페이지.
- **`write_ok.jsp`**: 작성된 게시글을 처리하는 페이지.
- **`edit.jsp`**: 기존 게시글을 수정하는 폼 페이지.
- **`edit_ok.jsp`**: 수정된 게시글을 처리하는 페이지.
- **`delete_ok.jsp`**: 삭제된 게시글 결과를 출력하는 페이지.
- **`top.jsp` / `bottom.jsp`**: 페이지의 상단 및 하단 공통 레이아웃을 포함하는 파일들.
- **`form.html`**: 간단한 폼 테스트 페이지.
- **`form_ok.jsp`**: 폼 데이터 처리 페이지.
- **`style.css`**: 프로젝트의 스타일을 정의하는 CSS 파일.

### 기능

- **게시글 작성 (Create)**: `write.jsp`에서 새로운 게시글을 작성하고 `write_ok.jsp`에서 처리합니다.
- **게시글 수정 (Update)**: `edit.jsp`에서 기존 게시글을 수정하고, `edit_ok.jsp`에서 수정된 데이터를 처리합니다.
- **게시글 삭제 (Delete)**: `delete_ok.jsp`에서 게시글을 삭제한 후 결과를 표시합니다.
- **게시글 목록 (Read)**: `board.jsp`에서 게시글 목록을 표시하며, 각 게시글은 `edit.jsp`와 `delete.jsp`에서 수정 및 삭제할 수 있습니다.

### JavaScript Validation

- **폼 유효성 검사**: 게시글 작성 및 수정 폼에서 JavaScript를 사용하여 필수 입력 항목이 비어 있지 않도록 검증합니다.
    - 제목, 작성자, 내용 필드가 모두 작성되었는지 확인하며, 비어 있을 경우 폼 제출을 막고 경고 메시지를 표시합니다.

### 공통 레이아웃

- **`top.jsp`**와 **`bottom.jsp`** 파일을 사용하여 모든 페이지에서 공통된 레이아웃을 적용합니다.
    - `top.jsp`는 페이지 상단의 네비게이션 메뉴 등을 포함하고, `bottom.jsp`는 페이지 하단의 정보를 포함합니다.

## 사용 방법

1. **프로젝트 실행**:
    - 이 프로젝트는 JSP를 지원하는 서버(예: Apache Tomcat)에서 실행할 수 있습니다.
    - 프로젝트를 Tomcat 서버의 `webapps` 폴더에 배치한 후 서버를 시작합니다.

2. **폼 제출**:
    - `write.jsp`에서 새로운 게시글을 작성하고 제출하면, `write_ok.jsp`에서 처리됩니다.
    - `edit.jsp`에서 기존 게시글을 수정하고 제출하면, `edit_ok.jsp`에서 수정된 게시글이 처리됩니다.
    - 각 폼에는 JavaScript 유효성 검사가 적용되어 있어 제목, 작성자, 내용이 비어있으면 경고 메시지가 표시됩니다.

3. **삭제 처리**:
    - 게시글 삭제는 `delete_ok.jsp`에서 처리됩니다. 삭제된 후 결과 메시지를 표시하고 게시판 목록 페이지로 돌아갈 수 있는 링크가 제공됩니다.


[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/l13IeRQ_)
