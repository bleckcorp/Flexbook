package com.flexbook.flexbook.controller;

import com.flexbook.flexbook.DAO.PostDatabase;
import com.flexbook.flexbook.model.Post;
import com.flexbook.flexbook.model.User;
import com.flexbook.flexbook.utilities.ConnectionManager;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Main
{
    public static void main(String[] args)
    {



//        User user = new User ("John", "Doe", "djdjdj", "ss", "djdjd", "sjsjsj");
//
//        PostDatabase postData = new PostDatabase(ConnectionManager.getConnection());
//
//
//        List<Post> posts = postData.getPosts(user);
//
//        for (Post post : posts) {
//            System.out.println(post.getTitle() + " " + post.getBody());
//        }



    }

//    public class MinTotalMarks {
//        public static int maxMarks(int[] marks, int minMark) {
//            Set<Integer> usedMarks = new HashSet<>();
//            int totalMarks = 0;
//
//            for (int mark : marks) {
//                int maxMark = Math.max(mark, minMark);
//                while (usedMarks.contains(maxMark)) {
//                    maxMark++;
//                }
//                usedMarks.add(maxMark);
//                totalMarks += maxMark;
//                minMark = maxMark;
//            }
//            return totalMarks;
//        }
//
//
//
//        public static void main(String[] args) {
//            int[] input1 = {1, 2, 3, 4, 5};
//            int[] input2 = {1, 3, 3, 5, 7};
//            int output1 = maxMarks(input1, 1);
//            int output2 = maxMarks(input2, 1);
//            System.out.println("For input1: " + Arrays.toString(input1) + " the minimum total marks are " + output1);
//            System.out.println("For input2: " + Arrays.toString(input2) + " the minimum total marks are " + output2);
//        }
//    }

}
