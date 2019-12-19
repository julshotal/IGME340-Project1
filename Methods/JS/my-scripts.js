/*
 my-scripts.js
 
 DEPENDENCIES
 This code assumes the following symbols are in the global scope:
 - RiTa
 - RiString
 - RiGrammar
 - RiMarkov
 - RiWordNet
 - RiLexicon
 - RiTaEvent
 
 RiTa DOCUMENTATION --> https://rednoise.org/rita/
 */

//get syllables of a word via the riTa library
function syllables(word){
    return RiTa.getSyllables(word);
}


