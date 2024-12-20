package org.example;

public class Word {
    private int id;
    private int level;
    private String word;
    private String meaning;
    public Word(int id, int level, String word, String meaning) {
        this.id = id;
        this.level = level;
        this.word = word;
        this.meaning = meaning;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getLevel() {
        return level;
    }
    public void setLevel(int level) {
        this.level = level;
    }
    public String getWord() {
        return word;
    }
    public void setWord(String word) {
        this.word = word;
    }
    public String getMeaning() {
        return meaning;
    }
    public void setMeaning(String meaning) {
        this.meaning = meaning;
    }
    @Override
    public String toString() {
        String levelStars = "*".repeat(level); // Level에 따라 별 출력하기 (Level 2이라면 **출력)
        return String.format("%d %s\t%s\t%s", id, levelStars, word, meaning);
    }
}

