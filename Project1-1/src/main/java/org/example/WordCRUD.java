package org.example;

import java.util.ArrayList;
import java.util.List;

public class WordCRUD implements ICRUD {
    private List<Word> wordList;
    public WordCRUD() {
        wordList = new ArrayList<>();
    }
    @Override
    public int create(Object one) {
        Word newWord = (Word) one;
        wordList.add(newWord);
        return 1;
    }
    @Override
    public List<Word> list() {
        return wordList;
    }
    @Override
    public int update(Object one) {
        Word updatedWord = (Word) one;
        for (int i = 0; i < wordList.size(); i++) {
            if (wordList.get(i).getId() == updatedWord.getId()) {
                wordList.set(i, updatedWord);
                return 1;
            }
        }
        return 0;
    }
    @Override
    public int delete(int id) {
        for (int i = 0; i < wordList.size(); i++) {
            if (wordList.get(i).getId() == id) {
                wordList.remove(i);
                // 단어를 삭제 했을 때를 대비해 단어들의 id를 재설정
                for (int j = 0; j < wordList.size(); j++) {
                    wordList.get(j).setId(j + 1);
                }
                return 1;
            }
        }
        return 0;
    }
}
