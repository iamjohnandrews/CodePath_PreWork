//: Playground - noun: a place where people can play

import UIKit

/*
 Given a set of distinct integers, S, return all possible subsets.
 
 Note:
 Elements in a subset must be in non-descending order.
 The solution set must not contain duplicate subsets.
 Also, the subsets should be sorted in ascending ( lexicographic ) order.
 The list is not necessarily sorted.
 Example :
 
 If S = [1,2,3], a solution is:
 
 [
 [],
 [1],
 [1, 2],
 [1, 2, 3],
 [1, 3],
 [2],
 [2, 3],
 [3],
 ]
 */
func subsets(_ A: inout [Int], temp: inout [Int], index: Int, result: inout [[Int]]) {
  
  if index == A.count {
    result.append(Array(temp))
    return
  }
  
  subsets(&A, temp: &temp, index: index + 1, result: &result)
  temp.append(A[index])
  subsets(&A, temp: &temp, index: index + 1, result: &result)
  temp.removeLast()
}

func subsets(_ A: inout [Int]) -> [[Int]] {
  
  var result: [[Int]] = []
  var temp: [Int] = []
  
  A.sort()
  
  subsets(&A, temp: &temp, index: 0, result: &result)
  
  result.sort() {
    
    let firstSize = $0.count
    let secondSize = $1.count
    
    for i in 0..<min(firstSize, secondSize) {
      if $0[i] != $1[i] {
        return $0[i] < $1[i]
      }
    }
    
    return firstSize < secondSize
  }
  
  return result
}

/*
 Given a digit string, return all possible letter combinations that the number could represent.
 
 A mapping of digit to letters (just like on the telephone buttons) is given below.
 
 
 
 The digit 0 maps to 0 itself.
 The digit 1 maps to 1 itself.
 
 Input: Digit string "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 Make sure the returned strings are lexicographically sorted.
 */
let numberToLetters: [String: [String]] = [
  "0": ["0"],
  "1": ["1"],
  "2": ["a", "b", "c"],
  "3": ["d", "e", "f"],
  "4": ["g", "h", "i"],
  "5": ["j", "k", "l"],
  "6": ["m", "n", "o"],
  "7": ["p", "q", "r", "s"],
  "8": ["t", "u", "v"],
  "9": ["w", "x", "y", "z"]
]

func getLetterAtIndex(_ index: Int, inWord word: inout String) -> String {
  let startIndex = word.index(word.startIndex, offsetBy: index)
  let endIndex = word.index(word.startIndex, offsetBy: index)
  let letter = String(word[startIndex...endIndex])
  
  return letter
}

func letterCombinations(_ A: inout String, letterIndex: Int, results: inout [String], temp: inout String) {
  
  let currentLetter = getLetterAtIndex(letterIndex, inWord: &A)
  if currentLetter >= "0" && currentLetter <= "9" {
    
    guard let lettersForNumber = numberToLetters[currentLetter] else {
      return
    }
    
    for letter in lettersForNumber {
      
      temp += letter
      
      if letterIndex == A.count - 1 {
        results.append(temp)
      } else {
        letterCombinations(&A, letterIndex: letterIndex + 1, results: &results, temp: &temp)
      }
      
      temp.remove(at: temp.index(before: temp.endIndex))
    }
  }
}

func letterCombinations(_ A: inout String) -> [String] {
  var results: [String] = []
  var temp = ""
  letterCombinations(&A, letterIndex: 0, results: &results, temp: &temp)
  return results
}  

/*
 Given a string s, partition s such that every string of the partition is a palindrome.
 
 Return all possible palindrome partitioning of s.
 
 For example, given s = "aab",
 Return
 
 [
 ["a","a","b"]
 ["aa","b"],
 ]
 Ordering the results in the answer : Entry i will come before Entry j if :
 len(Entryi[0]) < len(Entryj[0]) OR
 (len(Entryi[0]) == len(Entryj[0]) AND len(Entryi[1]) < len(Entryj[1])) OR
 *
 *
 *
 (len(Entryi[0]) == len(Entryj[0]) AND … len(Entryi[k] < len(Entryj[k]))
 In the given example,
 ["a", "a", "b"] comes before ["aa", "b"] because len("a") < len("aa")
 */
/**
 * @input A : String termination by '\0'
 * 
 * @Output Array of array of strings. You need to malloc memory. Fill in len1 as row. 
 * len2 should be an integer array of size = len1 when len2[i] denotes the number of columns in Z[i]. 
 * The strings should be terminated by '\0'
 *
 * For example, if the output was Z = [ ["abcd", "efg"], ["hij"], ["k", "l", "mn"] ] 
 * len1 = 3
 * len2 = [2, 1, 3] because there are 2 strings in Z[0], 1 string in Z[1], and 3 strings in Z[2].
 */
int row;
void recuv_count_partion(char* A,int pos,int *cnt2){
  if(pos >= strlen(A)){
    *cnt2 = *cnt2+1;
    return;
  }
  else{
    int p = 0;
    int i=pos;
    /*str[idx] = (char*)malloc(sizeof(char)*(2));
     str[idx][0] = A[pos];
     str[idx][1] = '\0';*/
    recuv_count_partion(A,pos+1,cnt2);
    for(i=pos+1;i<strlen(A);i++){
      int cnt = 0;
      int k = i;
      int j = i-1;
      while((A[k]==A[j])&&(j>=pos)&&(k<strlen(A))){
        cnt++;
        k++;
        j--;
      }
      j++;
      k--;
      int l;
      if((j==pos)&&(A[j]==A[k])){
        /*str[idx] = (char*)malloc(sizeof(char)*(cnt*2+1));
         for(l=0;l<2*cnt;l++){
         str[idx][l] = A[pos+l];
         }
         str[idx][2*cnt] = '\0';*/
        recuv_count_partion(A,pos+cnt*2,cnt2);
        
      }
      k = i+1;
      j = i-1;
      cnt=0;
      while((A[k]==A[j])&&(j>=pos)&&(k<strlen(A))){
        cnt++;
        k++;
        j--;
      }
      j++;
      k--;
      if((j==pos)&&(A[j]==A[k])){
        /*str[idx] = (char*)malloc(sizeof(char)*(cnt*2+2));
         for(l=0;l<2*cnt+1;l++){
         str[idx][l] = A[pos+l];
         }
         str[idx][2*cnt+1] = '\0';*/
        recuv_count_partion(A,pos+cnt*2+1,cnt2);
        
      }
      
      
      
    }
    
  }
} 
void recuv_get_partion(char* A,int pos,char** str,int idx,char*** res,int*len2){
  if(pos >= strlen(A)){
    int i;
    res[row] = (char**)malloc(sizeof(char*)*idx);
    len2[row] = idx;
    //printf("%d row %d cols: ",row,len2[row]);
    for(i=0;i<idx;i++){
      res[row][i] = (char*)malloc(sizeof(char)*(strlen(str[i])+1));
      strcpy(res[row][i],str[i]);
      //printf("%s ",res[row][i]);
    }
    row++;
    //printf("\n");
  }
  else{
    int p = 0;
    int i=pos;
    str[idx] = (char*)malloc(sizeof(char)*(2));
    str[idx][0] = A[pos];
    str[idx][1] = '\0';
    recuv_get_partion(A,pos+1,str,idx+1,res,len2);
    for(i=pos+1;i<strlen(A);i++){
      int cnt = 0;
      int k = i;
      int j = i-1;
      while((A[k]==A[j])&&(j>=pos)&&(k<strlen(A))){
        cnt++;
        k++;
        j--;
      }
      j++;
      k--;
      int l;
      if((j==pos)&&(A[j]==A[k])){
        str[idx] = (char*)malloc(sizeof(char)*(cnt*2+1));
        for(l=0;l<2*cnt;l++){
          str[idx][l] = A[pos+l];
        }
        str[idx][2*cnt] = '\0';
        recuv_get_partion(A,pos+cnt*2,str,idx+1,res,len2);
        
      }
      k = i+1;
      j = i-1;
      cnt=0;
      while((A[k]==A[j])&&(j>=pos)&&(k<strlen(A))){
        cnt++;
        k++;
        j--;
      }
      j++;
      k--;
      if((j==pos)&&(A[j]==A[k])){
        str[idx] = (char*)malloc(sizeof(char)*(cnt*2+2));
        for(l=0;l<2*cnt+1;l++){
          str[idx][l] = A[pos+l];
        }
        str[idx][2*cnt+1] = '\0';
        recuv_get_partion(A,pos+cnt*2+1,str,idx+1,res,len2);
        
      }
      
      
      
    }
    
  }
} 
char*** partition(char* A, int *len1, int *len2) {
  char** str = (char**)malloc(sizeof(char*)*100);
  int cnt= 0;
  recuv_count_partion(A,0,&cnt);
  //printf("cnt:%d",cnt);
  //char***res;
  char*** res = (char***)malloc(sizeof(char**)*cnt);
  len2 = (int*)malloc(sizeof(int)*cnt);
  
  row = 0;
  recuv_get_partion(A,0,str,0,res,len2);
  *len1 = 0;
  int i,j;
  for(i=0;i<row;i++){
    printf("[");
    for(j=0;j<len2[i];j++){
      
      printf("%s ",res[i][j]);
      
    }
    printf("] ");
    //printf("%d",len2[i]);
  }
  return res;
}

/*
 The set [1,2,3,…,n] contains a total of n! unique permutations.
 
 By listing and labeling all of the permutations in order,
 We get the following sequence (ie, for n = 3 ) :
 
 1. "123"
 2. "132"
 3. "213"
 4. "231"
 5. "312"
 6. "321"
 Given n and k, return the kth permutation sequence.
 
 For example, given n = 3, k = 4, ans = "231"
 
 Good questions to ask the interviewer :
 What if n is greater than 10. How should multiple digit numbers be represented in string?
 In this case, just concatenate the number to the answer.
 so if n = 11, k = 1, ans = "1234567891011" 
 Whats the maximum value of n and k?
 In this case, k will be a positive integer thats less than INT_MAX.
 n is reasonable enough to make sure the answer does not bloat up a lot. 
 */
/**
 * @input n : Integer
 * @input k : Integer
 * 
 * @Output string. Make sure the string ends with null character
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//#include <cstdlib>
char* itoa(int val){
  
  char *str=malloc(sizeof(char)*10);
  int c=0,num=val,i;
  while (num)
  {
    str[c++]=(char)((num%10)+48);
    num=num/10;
  }
  for (i=0;i<c/2;i++)
  {
    char temp=str[0];
    str[0]=str[c-1-i];
    str[c-1-i]=temp;
  }
  return str;
  
}
int get(int *list,int n,int x)
{
  int i,c=0;
  for (i=0;i<n;i++)
  {
    if (list[i]!=0 && c==x)
    {
      list[i]=0;
      return i+1;
    }
      
    else
    {
      if (list[i]!=0)
      c++;
    }
    
  }
  return 0;
}  
int fact(int n)
{
  if (n>=12)
  return INT_MAX;
  if (n<=1)
  return 1;
  else return n*fact(n-1);
}
char* getPermutation(int n, int k) {
  int val=k-1;
  int *list=(int*)malloc(sizeof(int)*n);
  int i;
  for (i=0;i<n;i++)
  list[i]=i+1;
  char *result=(char *)malloc(sizeof(char)*100000);
  for (i=0;i<n;i++)
  {
    int temp=val;
    temp=(val)/fact(n-1-i);
    int num=get(list,n,temp);
    char *str=(char*)malloc(sizeof(char)*100000);
    str=itoa(num);
    strcat(result,str);
    //printf("%d ",num);
    val=val%fact(n-1-i);
  }
  return result;
}

/*
 Given a collection of numbers, return all possible permutations.
 
 Example:
 
 [1,2,3] will have the following permutations:
 
 [1,2,3]
 [1,3,2]
 [2,1,3] 
 [2,3,1] 
 [3,1,2] 
 [3,2,1]
 */
func permute(_ A: inout [Int]) -> [[Int]] {
  
  var permutations: [[Int]] = []
  
  // base case
  if A.count == 1 {
    permutations.append(A)
    return permutations
  }
  
  // get first element and remining 
  // elements after the first one
  var first = A[0]
  var remainder = Array(A[1..<A.count])
  
  // get permutations for n-1 elements
  var subPermutations = permute(&remainder)
  
  // insert first element into each 
  // slot for each n-1 permutation
  for row in subPermutations {
    for i in 0...row.count {
      var newRow = row
      newRow.insert(first, at: i)
      permutations.append(newRow)
    }
  }
  
  return permutations
}

/*
 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
 
 N Queens: Example 1
 
 Given an integer n, return all distinct solutions to the n-queens puzzle.
 
 Each solution contains a distinct board configuration of the n-queens’ placement, where 'Q' and '.' both indicate a queen and an empty space respectively.
 
 For example,
 There exist two distinct solutions to the 4-queens puzzle:
 
 [
 [".Q..",  // Solution 1
 "...Q",
 "Q...",
 "..Q."],
 
 ["..Q.",  // Solution 2
 "Q...",
 "...Q",
 ".Q.."]
 ]
 */
/**
 * @input A : Integer
 * 
 * @Output 2D string array. You need to malloc memory. Fill in len1 as row, len2 as columns. All strings should end with '\0'. 
 * For example, a valid output : [["..Q.","Q...", "...Q", ".Q.." ], [".Q..", "...Q", "Q...", "..Q."]] 
 * len1 = 2, len2 = 4. 
 */

void mark(char* board, int A, int row, int col)
{
  int i;
  *((board+(A*row)) +col) = 'Q';
  for (i=0;i<A;i++)
  {
    if (*((board+(A*row))+i) == 'y') *((board+(A*row))+i) = 'n';
    if (*((board+(A*i))+col) == 'y') *((board+(A*i))+col) = 'n';
    //printf("(row-i) >= 0 && (col-i) >= 0\n");
    //fflush(stdout);
    // row-1,col-1
    if ((row-i) >= 0 && (col-i) >= 0 && *(board+(A*(row-i))+col-i) == 'y') *(board+(A*(row-i))+col-i) = 'n';
    //printf("(row-i) >= 0 && (col-i) >= 0\n");
    //fflush(stdout);
    // row+1,col-1
    if ((row+i) < A && (col-i) >= 0 && *(board+(A*(row+i))+col-i) == 'y') *(board+(A*(row+i))+col-i) = 'n';
    //printf("(row+i) < A && (col-i) >= 0\n");
    //fflush(stdout);
    // row-1,col+1
    if ((row-i) >= 0 && (col+i) < A && *(board+(A*(row-i))+col+i) == 'y') *(board+(A*(row-i))+col+i) = 'n';
    //printf("(row-i) >= 0 && (col+i) < A\n");
    //fflush(stdout);
    // row+1,col+1
    if ((row+i) < A && (col+i) < A && *(board+(A*(row+i))+col+i) == 'y') *(board+(A*(row+i))+col+i) = 'n';
  }
}
void nq(int A, int line, char ***ret, int *out, char* board)
{
  //printf ("line=%d, out=%d\n",line,*out);
  //fflush(stdout);
  char my_board[A][A];
  int i,j; 
  if (line == A)
  {
    // generate here. 
    ret[*out] = (char **)malloc(sizeof(char*) * A);
    for (i=0;i<A;i++)
    {
      ret[*out][i] = (char *)malloc(sizeof(char) * (A+1));
      for (j=0;j<A;j++)
      {
        ret[*out][i][j] = (*((board+(A*i))+j)=='Q')?'Q':'.';
      }
      ret[*out][i][j] = '\0';
    }
    (*out)++;
    return; 
  }
  //printf("before\n");
  //fflush(stdout);
  memcpy(my_board,board,(A*A*sizeof(char)));
  //printf("after\n");
  //fflush(stdout);
  for (i=0;i<A;i++)
  {
    //printf("checking: %d,%d\n",line,i);
    //fflush(stdout);
    if (my_board[line][i] == 'y')
    {
      mark((char *)my_board, A, line,i);
      nq(A,line+1,ret,out,(char *)my_board);
      memcpy(my_board,board,(A*A*sizeof(char)));
    }
  }
}
char*** solveNQueens(int A, int *len1, int *len2) {
  char board[A][A];
  char ***ret = (char ***)malloc(sizeof(char **) * 5000);
  *len1 = 0; 
  *len2 = A;
  int i,j;
  for (i=0;i<A;i++)
  for (j=0;j<A;j++)
  board[i][j] = 'y';
  nq(A,0,ret,len1, (char *)board);
  return ret; 
  
}
