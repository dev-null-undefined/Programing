
import java.io.File;
import java.util.ArrayList;
import java.util.LinkedList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Martin
 */
public class FileCounter {

    /**
     * @param args the command line arguments
     */
    private static final String Usage = ""
            + "Usage: File-counter -sourceFolder [-t] [-s] [-i] [-d] [-f] [-p] [-help] \n"
            + "Options:\n"
            + "     -p preview only\n"
            + "     -t Count of chars to delete before each file name.\n"
            + "     -s count of char before deleting part.\n"
            + "     -i where to put counter.\n"
            + "     -d how many digits for better formation.\n"
            + "     -f take files from sub folders too.\n"
            + "     -help display this menu.";
    static String paramSourceForder;
    static int countCharsBeforeDelete = 0;
    static int countCharsToDelete = 0;
    static int counterPos = 0;
    static int digits = 0;
    static boolean paramSubFolders = false;
    static boolean preview = false;

    public static void main(String[] args) {
        // TODO code application logic here
        if (args.length == 0 || args.length > 11) {
            System.out.println(Usage);
        }
        paramSourceForder = args[0];
        int option = 0;
        String param;
        for (int index = 1; index < args.length; index++) {
            param = args[index];
            switch (param) {
                case "-t":
                    option = 1;
                    break;
                case "-s":
                    option = 2;
                    break;
                case "-i":
                    option = 3;
                    break;
                case "-d":
                    option = 4;
                    break;
                case "-f":
                    option = 5;
                    break;
                case "-p":
                    option = 6;
                    break;
                case "-help":
                    System.out.println(Usage);
                    break;
                default:
                    if (option == 0) {
                        System.out.println("Wrong param input try File-rename.jar -help");
                        System.exit(0);
                    } else {
                        switch (option) {
                            case 1:
                                countCharsToDelete = Integer.valueOf(param);
                                break;
                            case 2:
                                countCharsBeforeDelete = Integer.valueOf(param);
                                break;
                            case 3:
                                counterPos = Integer.valueOf(param);
                                break;
                            case 4:
                                digits = Integer.valueOf(param);
                                break;
                            case 5:
                                paramSubFolders = Boolean.valueOf(param);
                                break;
                            case 6:
                                preview = Boolean.valueOf(param);
                        }
                        option = 0;
                    }
            }
        }

        /*System.out.println("paramSourceForder"+paramSourceForder+
                "\ncountCharsBeforeDelete"+countCharsBeforeDelete+
                "\ncountCharsToDelete"+countCharsToDelete+
                "\ncounterPos"+counterPos+
                "\ndigits"+digits);*/
        rename(getFilesFromDir(new File(paramSourceForder)));
    }

    public static void rename(ArrayList<File> files) {
        int counter = 0;
        String counterString;
        for (File currentFile : files) {
            String fileName = currentFile.getName();
            fileName = fileName.substring(0, countCharsBeforeDelete) + fileName.substring(countCharsBeforeDelete + countCharsToDelete);
            if (digits == 0) {
                counterString = counter + "";
            } else {
                counterString = String.format("%0" + digits + "d", counter);
            }
            fileName = fileName.substring(0, counterPos) + counterString + fileName.substring(counterPos);
            if (preview) {
                System.out.println(fileName);
            } else {
                currentFile.renameTo(new File(currentFile.getParent() + "\\" + fileName));
            }
            counter++;
        }
    }

    public static ArrayList<File> getFilesFromDir(File dir) {
        ArrayList<File> arrayFolders = new ArrayList<>();// Returning list of files in every subfodler
        for (File fileInFolderNotSorted : dir.listFiles()) {// for each file and folder in dir
            if (fileInFolderNotSorted.isDirectory()) {// if is it folder
                if (paramSubFolders == true) {
                    arrayFolders.addAll(getFilesFromDir(fileInFolderNotSorted));
                }// then do recursion and add it into our
                // ArrayList of files
            } else {
                arrayFolders.add(fileInFolderNotSorted);// if it is a file add it
            }
        }
        return arrayFolders;// on end return
    }
}
