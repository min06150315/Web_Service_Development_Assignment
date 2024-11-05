package org.example;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class WordManager {
    private WordCRUD wordCRUD;
    Scanner sc = new Scanner(System.in);
    int id = 1;
    public WordManager() {
        wordCRUD = new WordCRUD();
        // 제목 출력
        System.out.println("*** MY VOCA ***");
        // Text 파일에서 단어 불러오는 함수 불러오기
        loadWordsFromFile();
    }
    public void start() {
        int menu;
        while (true) {
            // 사용자에게 기능 알려주기
            System.out.println("\n1.List 2.List(level) 3.Search 4.Add 5.Modify 6.Delete 7.Save file 0.Exit\n");
            // 원하는 기능 입력 받아서 실행하기
            System.out.print("=> 원하는 메뉴는? ");
            menu = sc.nextInt();
            sc.nextLine();

            if (menu == 1) listWords(); // 단어 목록 보기
            else if (menu == 2) listWordsByLevel(); // 수준별 단어 보기
            else if (menu == 3) searchWords(); // 단어 검색
            else if (menu == 4) addWord(); // 단어 추가
            else if (menu == 5) modifyWord(); // 단어 수정
            else if (menu == 6) deleteWord(); // 단어 삭제
            else if (menu == 7) saveFile(); // 파일 저장
            else if (menu == 0) {
                System.out.println("\n프로그램 종료! 다음에 만나요~"); // 나가기
                break;
            }
        }
    }
    public void loadWordsFromFile() { // 파일에서 단어 불러오기
        String filename = "word.txt"; // 파일 이름
        int wordCnt = 0; // 불러온 단어 개수를 저장할 변수

        try (BufferedReader br = new BufferedReader(new FileReader(filename))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split("\t"); // 파일에서 데이터를 '|'로 구분
                if (data.length == 4) { // 데이터가 정확히 4개인 경우만 처리
                    int id = Integer.parseInt(data[0]);
                    int level = Integer.parseInt(data[1]);
                    String word = data[2];
                    String meaning = data[3];
                    wordCRUD.create(new Word(id, level, word, meaning));
                    wordCnt++; // 단어 개수 증가
                }
            }
            System.out.println("\n=> " + wordCnt + "개 단어 로딩 완료!");
        } catch (FileNotFoundException e) {
            System.out.println("\n* 단어 파일이 존재하지 않습니다.");
        } catch (IOException e) {
            System.out.println("\n* 파일 읽기 중 오류가 발생했습니다.");
        }
    }

    public void listWords() { // 단어 목록 보기
        List<Word> words = wordCRUD.list();
        if (!words.isEmpty()) { // 리스트에 단어가 있을 때만 출력
            System.out.println("--------------------------------");
            for (Word i : words) { // 출력
                System.out.println(i.toString());
            }
            System.out.println("--------------------------------");
        }
    }
    public void listWordsByLevel() { // 수준별 단어 보기
        int wantLevel, wordIndex = 1;
        List<Word> words = wordCRUD.list(); // 단어 목록 가져오기

        // 난이도별 단어 목록을 저장할 리스트 생성 (1:초급, 2:중급, 3:고급)
        List<Word> level1Words = new ArrayList<>();
        List<Word> level2Words = new ArrayList<>();
        List<Word> level3Words = new ArrayList<>();

        // 각 단어의 난이도에 따라 분류하기
        for (Word i : words) {
            switch (i.getLevel()) {
                case 1:
                    level1Words.add(i);
                    break;
                case 2:
                    level2Words.add(i);
                    break;
                case 3:
                    level3Words.add(i);
                    break;
            }
        }
        // 원하는 단어 레벨 입력받기
        System.out.print("레벨(1:초급, 2:중급, 3:고급) 선택: "); 
        wantLevel = sc.nextInt();
        
        System.out.println("--------------------------------");
        switch (wantLevel) {
            case 1:
                for (Word i : level1Words) {
                    String levelStars = "*".repeat(i.getLevel());
                    System.out.println(wordIndex + " " + levelStars + "\t" + i.getWord() + "\t" + i.getMeaning());
                    wordIndex++;
                }
                break;
            case 2:
                for (Word i : level2Words) {
                    String levelStars = "*".repeat(i.getLevel());
                    System.out.println(wordIndex + " " + levelStars + "\t" + i.getWord() + "\t" + i.getMeaning());
                    wordIndex++;
                }
                break;
            case 3:
                for (Word i : level3Words) {
                    String levelStars = "*".repeat(i.getLevel());
                    System.out.println(wordIndex + " " + levelStars + "\t" + i.getWord() + "\t" + i.getMeaning());
                    wordIndex++;
                }
                break;
        }
        System.out.println("--------------------------------");
    }
    public void searchWords() { // 단어 검색
        String search;
        int wordIndex = 1;
        boolean isThere = false;
        List<Word> words = wordCRUD.list(); // 단어 목록 가져오기
        System.out.print("=> 검색할 단어 입력: "); // 검색할 문자 입력
        search = sc.nextLine();
        System.out.println("--------------------------------");
        for (Word i : words) { // 출력
            if (i.getWord().contains(search)) {
                System.out.println(wordIndex + "\t" + i.getWord() + "\t" + i.getMeaning());
                wordIndex++;
                isThere = true;
            }
        }

        if (!isThere) {
            System.out.println("* 해당 단어를 찾을 수 없습니다.");
        }

        System.out.println("--------------------------------");
    }
    public void addWord() { // 단어 추가
        int newLevel;
        String newWord, newMeaning;
        // 새로 추가할 단어의 난이도와 스펠링 입력 받기
        System.out.print("=> 난이도(1,2,3) & 새 단어 입력: ");
        newLevel = sc.nextInt();
        newWord = sc.next();

        sc.nextLine();

        // 새로 추가할 단어의 뜻 입력받기
        System.out.print("=> 뜻 입력: ");
        newMeaning = sc.nextLine();

        // 입력받은 값으로 새로운 단어 객체 생성하기
        Word newWordObject = new Word(id++, newLevel, newWord, newMeaning);

        // 단어를 목록에 추가하고 확인 문구 출력하기
        wordCRUD.create(newWordObject);
        System.out.println("* 추가 성공!");
    }
    public void modifyWord() { // 단어 수정
        String search, newMeaning;
        int searchTargetNum, wordIndex = 1;
        List<Word> words = wordCRUD.list(); // 단어 목록 가져오기

        System.out.print("=> 수정할 단어 검색: "); // 검색 할 문자 입력
        search = sc.nextLine();

        System.out.println("--------------------------------");
        List<Word> searchResults = new ArrayList<>(); // 검색된 단어 저장

        // 검색한 단어들 출력해서 보여주기
        for (Word i : words) {
            if (i.getWord().contains(search)) { // 검색하기
                searchResults.add(i); // 리스트에 따로 추가해놀기
                String levelStars = "*".repeat(i.getLevel());
                System.out.println(wordIndex + " " + levelStars + "\t" + i.getWord() + "\t" + i.getMeaning());
                wordIndex++;
            }
        }
        // 해당하는 단어가 없을 시에 수정 프로세스 종료
        if (searchResults.isEmpty()) {
            System.out.println("* 해당 단어를 찾을 수 없습니다.");
            System.out.println("--------------------------------");
            return;
        }

        System.out.println("--------------------------------");

        // 보여준 단어 목록에서 수정할 단어의 번호 입력받기
        System.out.print("=> 수정할 번호 선택: ");
        searchTargetNum = sc.nextInt();
        sc.nextLine();

        // 잘못된 번호를 입력했을 때에 수정 프로세스 종료
        if (searchTargetNum < 1 || searchTargetNum > searchResults.size()) {
            System.out.println("* 잘못된 번호를 입력했습니다.");
            return;
        }

        // 선택된 단어 가져오기
        Word selectedWord = searchResults.get(searchTargetNum - 1);

        System.out.print("=> 뜻 입력: "); // 새로운 뜻 입력받기
        newMeaning = sc.nextLine();
        selectedWord.setMeaning(newMeaning); // 새로운 뜻으로 수정

        System.out.println("* 수정 성공!"); // 수정 확인 메시지 출력
    }
    public void deleteWord() { // 단어 삭제
        String search, realDeleteCheck;
        int deleteTargetNum, wordIndex = 1;
        List<Word> words = wordCRUD.list(); // 단어 목록 가져오기

        System.out.print("=> 삭제할 단어 검색: ");
        search = sc.nextLine();

        System.out.println("--------------------------------");
        List<Word> searchResults = new ArrayList<>(); // 검색된 단어 저장

        // 검색한 단어들 출력해서 보여주기
        for (Word i : words) {
            if (i.getWord().contains(search)) { // 검색하기
                searchResults.add(i); // 검색된 단어 추가
                String levelStars = "*".repeat(i.getLevel());
                System.out.println(wordIndex + " " + levelStars + "\t" + i.getWord() + "\t" + i.getMeaning());
                wordIndex++;
            }
        }

        // 해당하는 단어가 없을 시에 삭제 프로세스 종료
        if (searchResults.isEmpty()) {
            System.out.println("* 해당 단어를 찾을 수 없습니다.");
            System.out.println("--------------------------------");
            return;
        }

        System.out.println("--------------------------------");

        // 출력한 단어 목록에서 삭제할 단어 번호 입력받기
        System.out.print("=> 삭제할 번호 선택: ");
        deleteTargetNum = sc.nextInt();
        sc.nextLine();

        // 잘못된 번호를 입력했을 때에 삭제 프로세스 종료
        if (deleteTargetNum < 1 || deleteTargetNum > searchResults.size()) {
            System.out.println("* 잘못된 번호를 입력했습니다.");
            return;
        }

        // 선택한 단어 삭제 확인
        System.out.print("=> 정말로 삭제하실래요?(Y/n) ");
        realDeleteCheck = sc.nextLine();

        // Y 또는 y를 입력 했을 시에 삭제하기
        if (realDeleteCheck.equalsIgnoreCase("Y") || realDeleteCheck.equalsIgnoreCase("y")) {
            int deleteId = searchResults.get(deleteTargetNum - 1).getId();
            int result = wordCRUD.delete(deleteId); // ID로 삭제

            if (result == 1) {
                System.out.println("* 삭제 성공!");
            } else {
                System.out.println("* 삭제 실패! 단어를 찾을 수 없습니다.");
            }
        } else {
            System.out.println("* 삭제가 취소되었습니다.");
        }
    }
    public void saveFile() { // 파일 저장
        String fileName = "word_list.txt"; // 저장할 파일 이름
        List<Word> words = wordCRUD.list(); // 단어 목록 가져오기

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName))) {
            for (Word word : words) {
                writer.write(word.getId() + "\t" + word.getLevel() + "\t" + word.getWord() + "\t" + word.getMeaning());
                writer.newLine(); // 각 단어마다 새로운 줄 추가
            }
            System.out.println("* 단어 목록이 성공적으로 저장되었습니다: " + fileName);
        } catch (IOException e) {
            System.out.println("* 파일 저장 중 오류가 발생했습니다: " + e.getMessage());
        }

    }
}
