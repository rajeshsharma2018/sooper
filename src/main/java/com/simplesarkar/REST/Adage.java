package com.simplesarkar.REST;

 
public class Adage {

	private String words;
	private int wordCount;
	
	public Adage(){} 
	
	@Override
	public String toString(){
		return words +" -- " + wordCount + " words" ;
	}
	
	public void setWords(String words){
		this.words = words;
		this.wordCount =  9;
	}
	
	
	public String getWords(){
		return this.words;
	}
	
	public void setWordCount(int wordCount){}

	public int getWordCount(){ return this.wordCount;  }
		
	}
 
