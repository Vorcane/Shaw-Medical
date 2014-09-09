program InitialDraft;
uses Crt, Dos, Classes, SysUtils, misc; {Used for the clear screens and the bright text}
label 1; {Used to jump to whatever part of the program is been tested}

const
  AUsername = 'Admin';     {The admin Username for the admin menu}
  APassword = 'Password';  {The admin Password for the admin menu}

Var Choice, ID, Counter, Counter2, Index, Keyinteger:integer;
    PatientFile, IDFile, FilenameFile, DoctorFile, AvApps, Appointment, BookedApps:text;
    Filename, PatientFName, PatientLName, PatientAddress, PPostCode, PatientTelephone, PDOB, PTitle:string; //patient strings
    AdminUsername, AdminPassword:string;    //log in details
    DTitle, DoctorFName, DoctorLName, DFilename, DID:string; //doctor strings
    time, ninjaline:string;
    Filearray : Array[1..999] of string;
    FileList, AppList:TStringList;
    Key:char;


//the patient module
Procedure AddPatient;
label 1;
begin

 assign(FilenameFile, 'FileFile.txt');   //assigns the file file
 ClrScr;   //first clear screen that clears the screen
 readln; {This fixed the program skipping a readln}
 1: {this allows the user to re enter information if there was an error}
 ClrScr; //second clear screen that fixes formatting issues with the readln
 assign(IDFile, 'IDFile.txt');      //assigns the ID file
 reset(IDFile);  {This opens the ID file for reading}
 readln(IDFile, ID);  {This reads the last used ID from the ID file}
 close(IDFile);     //closes the ID file

 Counter:= 1; {Initialises the counter}
 reset(FilenameFile); {opens the filename file for reading}
 while Not EoF(FilenameFile) do    {This should read the filenames from the file}
   begin
    readln(FilenameFile, Filename);  {Should read the filename from the file}
    Filearray[Counter]:= Filename;   {this sets the filenames to specific ids to be rewritten later}
    if EoF(FilenameFile) then break; {skips increasing the counter if at the end of the file}
    Inc(Counter);  {increases the counter by one}
   end;
 close(FilenameFile);

 ID:= ID + 1;   {This makes the next used ID different to the last one to preemptively fix any problems with patients with the same name}
 rewrite(IDFile);  {This clears the ID file}
 writeln(IDFIle, ID);         {This adds one to the last used ID for adding future patients}
 close(IDFile);

 writeln('  --------------------------------------------------------------------------- ');
 writeln(' |                       Welcome to the patient module                       | ');
 writeln(' |                                                                           | ');
 writeln(' |   Please enter patient name in format: FName_LName-',ID,'                     | ');{This instructs the user to enter the patients name with their unique ID at the end}
 writeln(' |                                                                           | ');
 writeln(' |   Patient File Name:                                                      | ');
 writeln(' |                                                                           | ');
 writeln(' |   Patient Title:                                                          | ');
 writeln(' |                                                                           | ');
 writeln(' |   Patient First Name:                                                     | ');
 writeln(' |                                                                           | ');
 writeln(' |   Patient Last Name:                                                      | ');
 writeln(' |                                                                           | ');
 writeln(' |   Patient Address:                                                        | ');
 writeln(' |                                                                           | ');
 writeln(' |   Patient Post Code:                                                      | ');
 writeln(' |                                                                           | ');
 writeln(' |   Patient Telephone:                                                      | ');
 writeln(' |                                                                           | ');
 writeln(' |   Patient Date Of Birth:                                                  | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln('  --------------------------------------------------------------------------- ');

 if ID<10 then
  begin
   GotoXY(60,4);  //goes to the end of the info line
   ClrEOL; //clears the line
   writeln('                  | ');    //inserts a space and line to fix formatting with low ID's
  end;

 gotoXY(25,6); //moves the cursor to the patient name field
 read(Filename); {This reads the patients name to make a file in their name}                       {saves all the written data to the text file}

 assign(PatientFile, 'Patients/'+Filename+'.txt'); {This assigns the identifier PatientFile to the patients file} {The plus sign makes it work, must join the strings or something}

 rewrite(PatientFile);      {This creates a new file in the name of the patient}
 writeln(PatientFile, FileName); {This writes the Filename used to the patients file}
 writeln(PatientFile, ID); {This writes the patients unique ID to their file}

 gotoXY(21,8); //moves the cursor to the patient title field
 readln;  //needed to stop a line skip
 readln(PTitle);  //reads the patient title
 writeln(PatientFile, PTitle); {this writes the patients title to their file}

 gotoXY(26,10); //moves the cursor to the patient first name field
 readln(PatientFName);    {This reads the patients name to save their details}
 writeln(PatientFile, PatientFName);    {This writes the patients first name to their file}

 gotoXY(25,12); //moves the cursor to the patient last name field
 readln(PatientLName);  //reads the patients last name from the user
 writeln(PatientFile, PatientLName);  {This writes the patients last name to their file}

 gotoXY(23,14); //moves the cursor to the patient address field
 readln(PatientAddress);  //reads the patient address from the user
 writeln(PatientFile, PatientAddress); {This writes the patients address to their file}

 gotoXY(25,16); //moves the cursor to the post code field
 readln(PPostCode); //reads the post code off the user
 writeln(PatientFile, PPostCode); {This writes the patients post code to their file}

 gotoXY(25, 18); //moves the cursor to the patient telephone field
 readln(PatientTelephone); //reads the patient telephone from the user
 writeln(PatientFile, PatientTelephone); {This writes the patients telephone to their file}

 gotoXY(29, 20); //moves the cursor to the patient date of birth field
 readln(PDOB);   //reads the patient date of birth from the user
 writeln(PatientFile, PDOB);   {This writes the patients Date of birth to their file}
 close(PatientFile);  //closes the patient file and saves the changes

 gotoXY(4,22);
 write('Is this information correct?              Press y for yes or n for no');
 Key:=ReadKey;     //this reads the key entered so the user doesnt need to press enter
 if Key = 'y' then     //if key is yes then displays a confirmation message
    begin
    Filearray[ID]:= Filename;  {Writes the new file name to the array at the ID location}
    Counter:= ID;              {Sets the counter to the new ID so everything is written correctly}
    {for ID:= 1 to Counter do
    writeln(Filearray[ID]);    This is debug code that is used to verify the array is working correctly by writing its contents to the console
    readln;}

    Counter:= ID;  {Makes sure the counter is set at the ID, shouldnt be needed but I dont want to touch it incase it breaks}
    rewrite(FilenameFile); {Clears the FilenameFile so the array can be rewritten to the file without any legacy data floating around}
    for ID:= 1 to Counter do    {This for loop writes the contents of the array to the text file}
    begin
     writeln(FilenameFile, Filearray[ID]);   {writes the filename belonging to the specified ID to the text file}
    end;
    close(FilenameFile);
    gotoXY(4,22); //goes to the line that used to have Is this info correct etc.
    ClrEOL;     //clears the line so new text can be put there
    writeln('Ok, infomation saved') {simply displays a confirmation message and continues back to the main menu}
    end
 else
   begin
   erase(PatientFile);  //erases the just created patient file so there arent files with wrong info floating around
   goto 1;   {returns to the top of the information enter area}
   end;
 delay(500);
end;
procedure ListPatients;

begin
 ClrScr; {Clears the menu previously on the page}
 writeln('  --------------------------------------------------------------------------- ');
 writeln(' |                    Welcome to the List patient module                     | ');
 writeln(' |                                                                           | ');
 writeln(' | This will display all patient file s currently registered with the system | ');{This instructs the user to enter the patients name with their unique ID at the end}
 writeln(' |                                                                           | ');
 writeln('  ---------------------------------------------------------------------------  ');
 writeln('');
 gotoXY(38,4);
 write('''');
 delay(500);
 gotoXY(4,5);
 write('ID');    {These three lines are needed to produce the output (ID's) because of the apostrophe problem}
 write('''');
 write('s:');

 assign(FilenameFile, 'FileFile.txt');
 Counter:= 1; {Initialises the counter}
 reset(FilenameFile); {opens the filename file for reading}
 while Not EoF(FilenameFile) do    {This should read the filenames from the file}
   begin
    readln(FilenameFile, Filename);  {Should read the filename from the file}
    Filearray[Counter]:= Filename;   {this sets the filenames to specific ids to be rewritten later}
    if EoF(FilenameFile) then break; {skips increasing the counter if at the end of the file}
    Inc(Counter);  {increases the counter by one}
   end;
 close(FilenameFile);

 {This procedure reads the ID from the ID file to ensure the correct number of files are written to the terminal}
 Counter:= 1;  {Resets the counter to 1}
 assign(IDFile, 'IDFile.txt');
 reset(IDFile);  {This opens the ID file for reading}
 readln(IDFile, ID);  {This reads the last used ID from the ID file}
 close(IDFile);

 GotoXY(1,7);
 Counter2:= 0;
 for Counter:= 1 to ID do   {Writes the correct amount of filenames up to the last ID used}
   begin
    writeln(Filearray[Counter]);    {Writes the filenames stored in the array to the terminal}
    Inc(Counter2); //Increases Counter2 by one
    if Counter2>5 then
       begin
         Counter2:= 0;  //resets the counter
         writeln('Press enter when ready to view the next page');
         readln;
         ClrScr;
         writeln('  --------------------------------------------------------------------------- ');
         writeln(' |                    Welcome to the List patient module                     | ');
         writeln(' |                                                                           | ');
         writeln(' | This will display all patient file s currently registered with the system | ');{This instructs the user to enter the patients name with their unique ID at the end}
         writeln(' |                                                                           | ');
         writeln('  ---------------------------------------------------------------------------  ');
         writeln('');
         gotoXY(38,4);
         write('''');
         delay(500);
         gotoXY(4,5);
         write('ID');    {These three lines are needed to produce the output (ID's) because of the apostrophe problem}
         write('''');
         write('s:');
         gotoXY(1,7);
       end;
   end;
 writeln('Please press enter to return to main menu');
 readln;
end;
Procedure EditPatient;
label 1; {Allows the user to edit another field at the end}
label 2; {Stops the program crashing if the user enters an invalid file name}
label 3; {Allows return to main menu if too many attempts made at file name}
begin
 readln; //fixes another skip line bug
 Counter:= 1; {Initialises the counter}
 2:  //allows the user to try again if an error is made with the file name
 ClrScr; {Gets rid of any previous menus}
 writeln('  --------------------------------------------------------------------------- ');
 writeln(' |                       Welcome to the edit patient module                  | ');
 writeln(' |                                                                           | ');
 writeln(' |   Please enter the patients filename                                      | ');  //the info line
 writeln(' |                                                                           | ');
 writeln(' |      Patient File Name:                                                   | ');
 writeln(' |                                                                           | ');
 writeln(' |   1. Patient Title:                                                       | ');
 writeln(' |                                                                           | ');
 writeln(' |   2. Patient First Name:                                                  | ');
 writeln(' |                                                                           | ');
 writeln(' |   3. Patient Last Name:                                                   | ');
 writeln(' |                                                                           | ');
 writeln(' |   4. Patient Address:                                                     | ');
 writeln(' |                                                                           | ');
 writeln(' |   5. Patient Post Code:                                                   | ');
 writeln(' |                                                                           | ');
 writeln(' |   6. Patient Telephone:                                                   | ');
 writeln(' |                                                                           | ');
 writeln(' |   7. Patient Date Of Birth:                                               | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln('  --------------------------------------------------------------------------- ');


 writeln('This screen allows you to edit a patients details');

 gotoXY(28,6); //moves the cursor to the patient name field
 readln(Filename);
 1:
 assign(PatientFile, 'Patients/'+Filename+'.txt'); {This assigns the identifier PatientFile to the patients file} {The plus sign makes it work, must join the strings or something}
 GotoXY(6,4); //puts the cursor at the info line
 ClrEOL;       //clears the info line
 write('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(PatientFile);   {Opens the patient file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           GotoXY(6,4);   //moves cursor to the info line
           ClrEOL;        //clears the info line
           writeln('Too many tries, press enter to return to main menu');
           delay(500);
           goto 3;      {go's to the end of the procedure}
         end;
      gotoXY(6,4);   //moves cursor to the info line
      ClrEOL;        //clears the info line
      write('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      delay(500);
      Inc(Counter); {Increases the counter by one}
      goto 2;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    GotoXY(6,4);//moves the cursor to the info line
    ClrEOL;     //clears the info line
    writeln('This is the current information for the patient:');
   end;
 readln(PatientFile, FileName); {reads the file name from the patients file}
 readln(PatientFile, ID);       {reads the ID from the patients file}
 readln(PatientFile, PTitle);         {reads the patients title from the patients file}
 readln(PatientFile, PatientFName);   {reads the patients details from the patient file}
 readln(PatientFile, PatientLName);   {reads the patients last name from the patients file}
 readln(PatientFile, PatientAddress); {reads the patients address from the patients file}
 readln(PatientFile, PPostCode);      {reads the patients post code from the patients file}
 readln(PatientFile, PatientTelephone);{reads the patients telephone from the patients file}
 readln(PatientFile, PDOB);           {reads the patients date of birth from the patients file}

 GotoXY(28,6);        //moves the cursor to the title line
 write(FileName);    {writes the File Name to the console at the desired location}

 GotoXY(24,8); //moves the cursor to the title line
 write(PTitle);          {Writes the title to the terminal}

 GotoXY(29,10); //moves the cursor to the first name line
 write(PatientFName); {writes the patients first name to the console}

 GotoXY(28,12); //moves the cursor to the patient last name line
 write(PatientLName); {writes the patients last name to the console}

 GotoXY(26,14); //moves the cursor to the patient address line
 write(PatientAddress); {writes the patients address to the console}

 GotoXY(28,16); //moves the cursor to the post code line
 write(PPostCode); {writes the patients post code to the console}

 GotoXY(28,18); //moves the cursor to the telephone line
 write(PatientTelephone); {writes the patients telephone to the console}

 GotoXY(32,20); //moves the cursor to the date of birth line
 write(PDOB);        {writes the patients date of birth to the console}
 close(PatientFile);
 delay(1000);
 writeln;

 GotoXY(6,4); //moves the cursor to the info line
 ClrEOL;
 write('Please enter the number of the field you wish to edit');
 {writeln('1: Title');
 writeln('2: First Name');
 writeln('3: Last Name');
 writeln('4: Address');
 writeln('5: Post Code');
 writeln('6: Telephone number');
 writeln('7: Date of Birth');
 writeln;}

 Key:= ReadKey;    {reads which number the user has chosen}
 Keyinteger:= integer(Key)-48;   //converts the char Key into an integer Keyinteger for use in the case
 delay(500);
 gotoXY(6,4); //moves the cursor to the info line
 ClrEOL;      //clears the info line
 write('Please enter the new detail: ');
 case Keyinteger of 1: readln(PTitle); {reads the new patient title, overwriting the previous one}
                    2: readln(PatientFName); {reads the new patient first name, overwriting the previous one}
                    3: readln(PatientLName); {reads the new patient last name, overwriting the previous one}
                    4: readln(PatientAddress); {reads the new patient address, overwriting the previous one}
                    5: readln(PPostCode);      {reads the new patient post code, overwriting the previous one}
                    6: readln(PatientTelephone); {reads the new patient telephone, overwriting the previous one}
                    7: readln(PDOB);             {reads the new patient date of birth, overwriting the previous one}
 end;
 rewrite(PatientFile);        {This clears the patients file for rewriting}
 writeln(PatientFile, FileName);          {This writes the patients file name to their file}
 writeln(PatientFile, ID);                {This writes the patients ID to their file}
 writeln(PatientFile, PTitle);            {This writes the patients title to their file}
 writeln(PatientFile, PatientFName);      {This writes the patients first name to their file}
 writeln(PatientFile, PatientLName);      {This writes the patients last name to their file}
 writeln(PatientFile, PatientAddress);    {This writes the patients address to their file}
 writeln(PatientFile, PPostCode);         {This writes the patients post code to their file}
 writeln(PatientFile, PatientTelephone);  {This writes the patients telephone number to their file}
 writeln(PatientFile, PDOB);              {This writes the patients date of birth to their file}
 close(PatientFile);                      {Saves the file}

 GotoXY(6,4); //moves the cursor to the info line
 ClrEOL; //clears the info line
 write('File adjusted, would you like to edit another field?  y = yes n = no');
 Key:= ReadKey;   {reads what option they chose}
 if Key = 'y' then goto 1;     //returns to near the top of the procedure if the user wishes to edit another field
 GotoXY(6,4); //moves the cursor to the info line
 ClrEOL; //clears the info line
 writeln('Please press enter to return to main menu');  //may or may not need to press enter
 delay(1500);
 3: {Allows for return to main menu if too many tries at file name made}
end;
Procedure RemovePatient;
label 1; {allows the user to back out of removing a patient if they came here in error}
label 2; {Allows the user to enter another filename if they make a mistake}
begin
 ClrScr;
 writeln(' ----------------------------------------------------------');
 writeln('|  This screen will allow you to delete a patients record  |');
 writeln('| This is irreversible, are you sure you wish to continue? |');
 writeln('|               Press y for yes or n for no                |');
 writeln('|                                                          |'); //info line
 writeln('|                                                          |');
 writeln('|                                                          |');
 writeln(' ----------------------------------------------------------');
 key:= ReadKey; //reads what the user chooses
 if Key = 'n' then goto 1;
 Counter2:= 1; //used to fix a readln skip without messing up the rest of the flow of the program
 2: {Allows the user to enter another filename if they make a mistake}
 gotoXY(10,5);
 if Counter2 = 1 then    //makes it so it only runs on first load of the module
    begin
      readln;          //fixes a skip readln issue
      Inc(Counter2);    //increase the counter so it doesnt run again
    end;
 writeln('Please enter the filename to be removed: ');
 GotoXY(5,7); //moves to space for input
 ClrEOL; //clears any existing text on that line
 readln(FileName); {reads the name of the file to be removed}
 assign(PatientFile, 'Patients/'+Filename+'.txt'); {assigns the term PatientFile to the selected file}

 GotoXY(10,6); //goes to the info line
 ClrEOL; //clears the info line
 writeln('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 Erase(PatientFile);   {Opens the patient file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           GotoXY(10,6); //goes to info line
           ClrEOL; //clears the info line
           writeln('Too many tries, returning to main menu');
           delay(500);
           goto 1;      {go's to the end of the procedure}
         end;
      GotoXY(10,6);  //goes to info line
      ClrEOL; //clears the info line
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      delay(500);
      Inc(Counter); {Increases the counter by one}
      goto 2;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    gotoXY(10,6);//goes to info line
    ClrEOL; //clears the info line
    writeln('File successfully removed');
    delay(500);
   end;
 assign(FilenameFile, 'FileFile.txt');
 FileList:= TStringList.Create;       {Creates a T String List under the name FileList}
 FileList.LoadFromFile('FileFile.txt');  {Loads all the filenames from the File name file into the T string list}
 Index:= FileList.IndexOf(FileName);     {Finds the index position of the filename been removed}
 FileList.Delete(Index);                 {deletes the filename been removed from the T string list}
 FileList.SaveToFile('FileFile.txt');    {Saves the modified T string list back to the File name file}
 FileList.free;                          {Deletes the T String List}
 1: {allows the user to exit the module if they dont want to remove a patient}
 writeln('Press enter to return to main menu');
end;
Procedure ViewPatient;
label 2;    {returns to enter file name in case of error}
label 3;    {Exits module if too many tries made}
begin
 Counter:= 1; {Initialises the counter}
 readln;
 2:  //allows the user to try again if an error is made with the file name
 ClrScr; {Gets rid of any previous menus}
 writeln('  --------------------------------------------------------------------------- ');
 writeln(' |                       Welcome to the view patient module                  | ');
 writeln(' |                                                                           | ');
 writeln(' |   Please enter the patients filename                                      | ');  //the info line
 writeln(' |                                                                           | ');
 writeln(' |      Patient File Name:                                                   | ');
 writeln(' |                                                                           | ');
 writeln(' |      Patient Title:                                                       | ');
 writeln(' |                                                                           | ');
 writeln(' |      Patient First Name:                                                  | ');
 writeln(' |                                                                           | ');
 writeln(' |      Patient Last Name:                                                   | ');
 writeln(' |                                                                           | ');
 writeln(' |      Patient Address:                                                     | ');
 writeln(' |                                                                           | ');
 writeln(' |      Patient Post Code:                                                   | ');
 writeln(' |                                                                           | ');
 writeln(' |      Patient Telephone:                                                   | ');
 writeln(' |                                                                           | ');
 writeln(' |      Patient Date Of Birth:                                               | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln('  --------------------------------------------------------------------------- ');


 writeln('This screen allows you to view a patients details');

 gotoXY(28,6); //moves the cursor to the patient name field
 readln(Filename);
 1:
 assign(PatientFile, 'Patients/'+Filename+'.txt'); {This assigns the identifier PatientFile to the patients file. The plus sign makes it work, must join the strings or something}
 GotoXY(6,4); //puts the cursor at the info line
 ClrEOL;       //clears the info line
 write('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(PatientFile);   {Opens the patient file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           GotoXY(6,4);   //moves cursor to the info line
           ClrEOL;        //clears the info line
           writeln('Too many tries, press enter to return to main menu');
           delay(500);
           goto 3;      {go's to the end of the procedure}
         end;
      gotoXY(6,4);   //moves cursor to the info line
      ClrEOL;        //clears the info line
      write('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      delay(500);
      Inc(Counter); {Increases the counter by one}
      goto 2;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    GotoXY(6,4);//moves the cursor to the info line
    ClrEOL;     //clears the info line
    writeln('This is the current information for the patient:');
   end;
 readln(PatientFile, FileName); {reads the file name from the patients file}
 readln(PatientFile, ID);       {reads the ID from the patients file}
 readln(PatientFile, PTitle);         {reads the patients title from the patients file}
 readln(PatientFile, PatientFName);   {reads the patients details from the patient file}
 readln(PatientFile, PatientLName);   {reads the patients last name from the patients file}
 readln(PatientFile, PatientAddress); {reads the patients address from the patients file}
 readln(PatientFile, PPostCode);      {reads the patients post code from the patients file}
 readln(PatientFile, PatientTelephone);{reads the patients telephone from the patients file}
 readln(PatientFile, PDOB);           {reads the patients date of birth from the patients file}

 GotoXY(28,6);        //moves the cursor to the title line
 write(FileName);    {writes the File Name to the console at the desired location}

 GotoXY(24,8); //moves the cursor to the title line
 write(PTitle);          {Writes the title to the terminal}

 GotoXY(29,10); //moves the cursor to the first name line
 write(PatientFName); {writes the patients first name to the console}

 GotoXY(28,12); //moves the cursor to the patient last name line
 write(PatientLName); {writes the patients last name to the console}

 GotoXY(26,14); //moves the cursor to the patient address line
 write(PatientAddress); {writes the patients address to the console}

 GotoXY(28,16); //moves the cursor to the post code line
 write(PPostCode); {writes the patients post code to the console}

 GotoXY(28,18); //moves the cursor to the telephone line
 write(PatientTelephone); {writes the patients telephone to the console}

 GotoXY(32,20); //moves the cursor to the date of birth line
 write(PDOB);        {writes the patients date of birth to the console}
 close(PatientFile);
 delay(1000);
 writeln;

 3: {Exits module if too many tries made}
end;
procedure PatientScreen;

begin
 clrscr;   {Clears the previous menu and displays the patient menu}
 writeln('  --------------------------------------------------------------------------- ');
 writeln(' |                       Welcome to the patient screen                       | ');
 writeln(' |                                                                           | ');
 writeln(' |   These are your current options, please choose a number when prompted    | ');
 writeln(' |                                                                           | ');
 writeln(' |   1: Add new patient to the system                                        | ');
 writeln(' |   2: Edit a current patients details                                      | ');
 writeln(' |   3: Remove a patient from the system                                     | ');
 writeln(' |   4: View a patients details                                              | ');
 writeln(' |   5: List all patients                                                    | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln('  --------------------------------------------------------------------------- ');
 gotoXY(6,13);
 write('Please select a number:');
 gotoXY(30,13);
 read(choice); {reads the choice from the cursor position which is after the please select a number}
 case choice of 1: AddPatient;
                2: EditPatient;
                3: RemovePatient;
                4: ViewPatient;
                5: ListPatients;
 end;
 readln;
end;

//the doctor module
procedure AddDoctor;
label 1; {Allows the user to edit what they entered if they made a mistake}
label 3;
begin
 Counter:= 1; //initalises the counter
 Counter2:= 1; //initialises the other counter
 1: {this allows the user to re enter information if there was an error}
 ClrScr;
 assign(IDFile, 'IDFile.txt');
 reset(IDFile);  {This opens the ID file for reading}
 readln(IDFile, ID);  {This reads the last used ID from the ID file}
 close(IDFile);
 ID:= ID + 1;   {This makes the next used ID different to the last one to preemptively fix any problems with patients with the same name}
 rewrite(IDFile);  {This clears the ID file}
 writeln(IDFIle, ID);         {This adds one to the last used ID for adding future patients}
 close(IDFile);

 writeln('  --------------------------------------------------------------------------- ');
 writeln(' |                       Welcome to the Doctor module                        | ');
 writeln(' |                                                                           | ');
 writeln(' |   Please enter Doctor name in format: FName_LName-',ID,'                      | ');{This instructs the user to enter the doctor's name with their unique ID at the end, also the info line}
 writeln(' |                                                                           | ');
 writeln(' |   Doctor File Name:                                                       | ');
 writeln(' |                                                                           | ');
 writeln(' |   Doctor Title:                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |   Doctor First Name:                                                      | ');
 writeln(' |                                                                           | ');
 writeln(' |   Doctor Last Name:                                                       | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln('  --------------------------------------------------------------------------- ');

 if ID<10 then
   begin
    GotoXY(60,4);  //goes to the end of the info line
    ClrEOL; //clears the line
    writeln('                  | ');    //inserts a space and line to fix formatting with low ID's
   end;

 //if Counter2 = 1 then     //makes for single run only code to fix a problem without causing others
  //begin
   //readln; {This fixed the program skipping a readln}
   //Inc(Counter2); //increases the counter allowing bypass of this code if a return to top is made
  //end;

 GotoXY(24,6); //moves to the file name line
 readln(Filename); {This reads the doctors name to make a file in their name}

 assign(DoctorFile, 'Doctors/'+Filename+'.txt'); {This assigns the identifier Doctor File to the Doctors file}
 GotoXY(6,4); //puts the cursor at the info line
 ClrEOL;       //clears the info line
 write('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 rewrite(DoctorFile);   {creates a new doctor file}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           GotoXY(6,4);   //moves cursor to the info line
           ClrEOL;        //clears the info line
           writeln('Too many tries, press enter to return to main menu');
           delay(500);
           goto 3;      {go's to the end of the procedure}
         end;
      gotoXY(6,4);   //moves cursor to the info line
      ClrEOL;        //clears the info line
      write('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      delay(500);
      Inc(Counter); {Increases the counter by one}
      goto 1;       {returns to the top of the procedure}
    end
 else
   begin
    writeln(DoctorFile, FileName); {This writes the Filename used to the Doctors file}
    writeln(DoctorFile, ID); {This writes the Doctors unique ID to their file}
   end;

 GotoXY(6,4); //moves to the info line
 ClrEOL; //clears the info line
 writeln('File created, please continue');

 GotoXY(20,8); //moves to the title line
 ClrEOL;       //clears any existing text
 readln(DTitle);   //reads the doctors title
 writeln(DoctorFile, DTitle); {this writes the Doctors title to their file}

 GotoXY(25,10); //moves to the first name line
 ClrEOL;       //clears any existing text
 readln(DoctorFName);    {This reads the Doctors name to save their details}
 writeln(DoctorFile, DoctorFName);    {This writes the doctors first name to their file}

 GotoXY(24,12); //moves to the last name line
 ClrEOL; //clears any existing text
 readln(DoctorLName);  //reads the doctors last name
 writeln(DoctorFile, DoctorLName);  {This writes the doctors last name to their file}
 close(DoctorFile); //saves and closes the doctor file

 gotoXY(6,4); //moves to the info line
 ClrEOL;      //clears the info line
 write('Is this information correct?              Press y for yes or n for no');
 Key:=ReadKey;     //this reads the key entered so the user doesnt need to press enter
 if Key = 'n' then      //if key is no then returns to top of procedure and erases new file
  begin
   erase(DoctorFile);
   goto 1;
  end;
 GotoXY(6,4);  //moves to the info line
 ClrEOL; //clears the info line
 writeln('Ok, infomation saved'); {simply displays a confirmation message and continues back to the main menu}
 delay(500);
 GotoXY(6,4); //moves to the info line
 ClrEOL; //clears the info line
 writeln('Press enter to continue please');
 delay(500);
 3:
end;
procedure EditDoctor;
label 1; {Allows the user to edit another field at the end}
label 2; {Stops the program crashing if the user enters an invalid file name}
label 3; {Allows return to main menu if too many attempts made at file name}
begin
 Counter:= 1; {Initialises the counter}
 1:
 ClrScr; {Gets rid of any previous menus}
 writeln('  --------------------------------------------------------------------------- ');
 writeln(' |                       Welcome to the Doctor module                        | ');
 writeln(' |                                                                           | ');
 writeln(' |   Please enter the doctors file name                                      | '); //the info line
 writeln(' |                                                                           | ');
 writeln(' |      Doctor File Name:                                                    | ');
 writeln(' |                                                                           | ');
 writeln(' |   1. Doctor Title:                                                        | ');
 writeln(' |                                                                           | ');
 writeln(' |   2. Doctor First Name:                                                   | ');
 writeln(' |                                                                           | ');
 writeln(' |   3. Doctor Last Name:                                                    | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln('  --------------------------------------------------------------------------- ');

 2:
 GotoXY(28,6); //moves to the file name line
 readln(Filename);  //reads the filename

 assign(DoctorFile, 'Doctors/'+Filename+'.txt'); {This assigns the identifier DoctorFile to the Doctors file} {The plus sign makes it work, must join the strings or something}
 GotoXY(6,4); //puts the cursor at the info line
 ClrEOL;       //clears the info line
 writeln('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(DoctorFile);   {Opens the Doctor file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
  begin
    if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
       begin
         GotoXY(6,4);   //moves cursor to the info line
         ClrEOL;        //clears the info line
         writeln('Too many tries, press enter to return to main menu');
         delay(500);
         goto 3;      {go's to the end of the procedure}
       end;
    gotoXY(6,4);   //moves cursor to the info line
    ClrEOL;        //clears the info line
    write('Error, file not found try again');   {Tells the user that they entered an invalid file name}
    delay(500);
    Inc(Counter); {Increases the counter by one}
    goto 1;       {returns to the top of the procedure}
  end
else
 begin
  GotoXY(6,4); //moves to the info line
  ClrEOL; //clears the info line
  writeln('File found, details below');
 end;
 readln(DoctorFile, FileName); {reads the file name from the Doctors file}
 readln(DoctorFile, ID);       {reads the ID from the Doctors file}
 readln(DoctorFile, DTitle);         {reads the Doctors title from the Doctors file}
 readln(DoctorFile, DoctorFName);   {reads the Doctors details from the Doctor file}
 readln(DoctorFile, DoctorLName);   {reads the Doctors last name from the Doctors file}

 GotoXY(24,8); //moves to the title line
 ClrEOL;       //clears any existing text
 writeln(DTitle);          {Writes the title to the terminal}

 GotoXY(29,10); //moves to the first name line
 ClrEOL;       //clears any existing text
 writeln(DoctorFName); {writes the Doctors first name to the console}

 GotoXY(28,12); //moves to the last name line
 ClrEOL; //clears any existing text
 writeln(DoctorLName); {writes the Doctors last name to the console}
 close(DoctorFile);
 delay(1000);

 GotoXY(6,4); //moves to the info line
 ClrEOL; //clears the info line
 writeln('Please enter the number of the field you wish to edit');

 Key:= ReadKey;    {reads which number the user has chosen}
 Keyinteger:= integer(Key)-48;   //converts the char Key into an integer Keyinteger for use in the case
 delay(500);
 gotoXY(6,4); //moves the cursor to the info line
 ClrEOL;      //clears the info line
 write('Please enter the new detail: ');
 case Keyinteger of 1: readln(PTitle); {reads the new Doctor title, overwriting the previous one}
                    2: readln(DoctorFName); {reads the new Doctor first name, overwriting the previous one}
                    3: readln(DoctorLName); {reads the new Doctor last name, overwriting the previous one}

 end;

 rewrite(DoctorFile);        {This clears the Doctors file for rewriting}
 writeln(DoctorFile, FileName);          {This writes the Doctors file name to their file}
 writeln(DoctorFile, ID);                {This writes the Doctors ID to their file}
 writeln(DoctorFile, PTitle);            {This writes the Doctors title to their file}
 writeln(DoctorFile, DoctorFName);      {This writes the Doctors first name to their file}
 writeln(DoctorFile, DoctorLName);      {This writes the Doctors last name to their file}
 close(DoctorFile);                      {Saves the file}

 GotoXY(6,4); //moves the cursor to the info line
 ClrEOL; //clears the info line
 write('File adjusted, would you like to edit another field?  y = yes n = no');
 Key:= ReadKey;   {reads what option they chose}
 if Key = 'y' then goto 1;     //returns to near the top of the procedure if the user wishes to edit another field
 GotoXY(6,4); //moves the cursor to the info line
 ClrEOL; //clears the info line
 writeln('Please press enter to return to main menu');  //may or may not need to press enter
 delay(1500);
 3: {Allows for return to main menu if too many tries at file name made}
end;
procedure GPScreen;
begin
  clrscr;   {Clears the previous menu and displays the patient menu}
  writeln('  --------------------------------------------------------------------------- ');
  writeln(' |                       Welcome to the Doctor  screen                       | ');
  writeln(' |                                                                           | ');
  writeln(' |   These are your current options, please choose a number when prompted    | ');
  writeln(' |                                                                           | ');
  writeln(' |   1: Add new Doctor  to the system                                        | ');
  writeln(' |   2: Edit a current Doctors details                                       | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln(' |                                                                           | ');
  writeln('  --------------------------------------------------------------------------- ');
  delay(500);
  gotoXY(6,13);
  write('Please select a number:');
  gotoXY(30,13);
  readln(choice); {reads the choice from the cursor position which is after the please select a number}
  case choice of 1: AddDoctor;
                 2: EditDoctor;
  end;

end;

//the appointment module
procedure AddAppointment;
label 2; {allows the user to try again if an error is made}
label 3; {exits the procedure if too many errors are made}
label 4; //allows the user to try again if too many errors are made
label 999; //Just cause (allows for re entering the time if a user mistake is made)
begin
 ClrScr;
 writeln('This screen allows you to add an appointment');
 assign(AvApps, 'Appointments/AvApps.txt');
 writeln('These are the currently available appointments:');
 reset(AvApps);   //opens the list of times for reading
 Counter:=0; //initialises the counter
 while not EoF(AvApps) do {reads the list of available appointments from the file}
   begin
    if EoF(AvApps) then break;  {leaves the loop if end of the file}
    readln(AvApps, time);   {reads a time from the file}
    writeln(time);          {writes the time to the file}
    inc(counter); //increases the counter
    if Counter = 5 then
       begin
       Counter:= 0; //reinitialises the counter
       writeln('Press enter to view next page');
       readln;
       ClrScr; //clears the screen
       end;
   end;
 close(AvApps);

 999: //allows the user to enter the time again if they make a mistake
 writeln('Please enter a time in format 0000xx, e.g 1030am or 0200pm');
 readln(time);    //reads what time the user wants to make an appointment for
 assign(appointment, 'Appointments/'+time+'.txt');
 writeln('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 rewrite(appointment);;   {creates a new appointment file at the specified time}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           writeln('Too many tries, returning to main menu');
           goto 3;      {go's to the end of the procedure}
         end;
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      Inc(Counter); {Increases the counter by one}
      goto 999;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    writeln('File created, proceeding now');
   end;

 writeln('Please enter the filename of the patient to be added');
 2: {allows the user to enter another filename if an error is made}
 readln(Filename);  {reads the name of the file to be displayed}
 assign(PatientFile, 'Patients/'+Filename+'.txt'); {This assigns the identifier PatientFile to the patients file} {The plus sign makes it work, must join the strings or something}

 writeln('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(PatientFile);   {Opens the patient file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           writeln('Too many tries, returning to main menu');
           goto 3;      {go's to the end of the procedure}
         end;
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      Inc(Counter); {Increases the counter by one}
      goto 2;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    writeln('Please enter the filename for the GP with whom the appointment is');
   end;
 readln(PatientFile, FileName); {reads the file name from the patients file}
 readln(PatientFile, ID);       {reads the ID from the patients file}
 readln(PatientFile, PTitle);         {reads the patients title from the patients file}
 readln(PatientFile, PatientFName);   {reads the patients details from the patient file}
 readln(PatientFile, PatientLName);   {reads the patients last name from the patients file}
 close(PatientFile);

 4: {allows the user to try again if an error is made}
 readln(DFilename);
 assign(DoctorFile, 'Doctors/'+DFilename+'.txt'); {This assigns the identifier DoctorFile to the Doctors file} {The plus sign makes it work, must join the strings or something}
 writeln('Checking for file...');
 delay(500);
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(DoctorFile);   {Opens the Doctor file for reading}
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           writeln('Too many tries, returning to main menu');
           goto 3;      {go's to the end of the procedure}
         end;
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      Inc(Counter); {Increases the counter by one}
      goto 4;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    ClrScr; //clears previous text
    writeln('These are the current appointment details:');
   end;
 readln(DoctorFile, DFileName); {reads the file name from the Doctors file}
 readln(DoctorFile, DID);       {reads the ID from the Doctors file}
 readln(DoctorFile, DTitle);         {reads the Doctors title from the Doctors file}
 readln(DoctorFile, DoctorFName);   {reads the Doctors details from the Doctor file}
 readln(DoctorFile, DoctorLName);   {reads the Doctors last name from the Doctors file}
 close(DoctorFile);

 writeln('Patient Filename: ', Filename);    //This outputs all the patients relevant details to the console for confirmation
 writeln('Patient ID: ', ID);
 writeln('Patient Title: ', PTitle);
 writeln('Patient Name: ', PatientFName, ' ', PatientLName);
 writeln;
 writeln('Doctor Filename: ', DFileName);   //This outputs all the doctors relevants details to the console for confirmation
 writeln('Doctor ID: ', DID);
 writeln('Doctor Title: ', DTitle);
 writeln('Doctor Name: ', DoctorFName, ' ', DoctorLName);
 writeln;
 writeln('Is this correct?');
 writeln('1: Yes');
 writeln('2: No');
 readln(Choice);//Reads whether or not the information is correct
 if Choice = 2 then
    begin
      writeln('Returning to main menu');
      goto 3; //go's to the end of the procedure
    end;
 writeln('Saving to file');
 rewrite(Appointment);//This next section writes all the appointment details to the appropriate file
 writeln(Appointment, Filename);
 writeln(Appointment, ID);
 writeln(Appointment, PTitle);
 writeln(Appointment, PatientFName);
 writeln(Appointment, PatientLName);
 writeln(Appointment, ' ');
 writeln(Appointment, DFilename);
 writeln(Appointment, DID);
 writeln(Appointment, DTitle);
 writeln(Appointment, DoctorFName);
 writeln(Appointment, DoctorLName);
 close(Appointment);

 assign(AvApps, 'Appointments/AvApps.txt');
 AppList:= TStringList.Create;       {Creates a T String List under the name AppList}
 AppList.LoadFromFile('Appointments/AvApps.txt');  {Loads all the appointments from the appointment list file into the T string list}
 Index:= AppList.IndexOf(time);     {Finds the index position of the appointment been taken}
 AppList.Delete(Index);                 {deletes the filename been removed from the T string list}
 AppList.SaveToFile('Appointments/Avapps.txt');    {Saves the modified T string list back to the Appointment list file}
 AppList.free;                          {Deletes the T String List}

 assign(BookedApps, 'Appointments/BookedApps.txt'); //assigns the term BookedApps to the file containing the booked appointments
 append(BookedApps);
 writeln(BookedApps, time);
 close(BookedApps);
 writeln('Please press enter when ready to continue');
 3:{exits the procedure if a mistake is made too many times}
end;
procedure ViewAppointment;
label 2;
label 3;
begin
 ClrScr;
 readln; //fixes one of them wierd readln bug things
 2:
 writeln('This will allow you to view the details of an appointment');
 writeln('Please enter the time for the appointment you wish to view in format 0000xx e.g 1230pm or 0400am');
 readln(time);    //reads what time the user wants to make an appointment for
 assign(Appointment, 'Appointments/'+time+'.txt'); //assigns the appointment name to the time read from the user
 {$i-}   {Turns off compiler error checking preventing the program from crashing if no file is at the entered name}
 reset(Appointment);//This next section reads all the appointment details
 {$i+}   {Turns compiler error checking back on}
 if IOresult<>0 then   {IOresult returns a value depending on whether or not there was an error with the input, 0 means no error}
    begin
      if Counter = 4 then {This returns to the main menu if too many tries are made to prevent been stuck there}
         begin
           writeln('Too many tries, press enter to return to the main menu');
           goto 3;      {go's to the end of the procedure}
         end;
      writeln('Error, file not found try again');   {Tells the user that they entered an invalid file name}
      Inc(Counter); {Increases the counter by one}
      goto 2;       {returns to just before asking the user to enter a file name}
    end
 else
   begin
    writeln('Here are the appointment details');
   end;

 readln(Appointment, Filename);          //reads the variables from the file
 readln(Appointment, ID);
 readln(Appointment, PTitle);
 readln(Appointment, PatientFName);
 readln(Appointment, PatientLName);
 readln(Appointment, ninjaline);  //needed to correctly read from the file due to the formatting
 readln(Appointment, DFilename);
 readln(Appointment, DID);
 readln(Appointment, DTitle);
 readln(Appointment, DoctorFName);
 readln(Appointment, DoctorLName);
 close(Appointment);

 writeln('Patient details');
 writeln(' Patient Filename: ',Filename);      //writes the read variables to the terminal
 writeln(' Patient ID: ',ID);
 writeln(' Patient Title: ',PTitle);
 writeln(' Patient First Name: ',PatientFName);
 writeln(' Patient Last Name: ',PatientLName);
 writeln(' ');   //adds a small space for formatting and ease of reading
 writeln('Doctor Details');
 writeln(' Doctor Filename: ',DFilename);
 writeln(' Doctor ID: ',DID);
 writeln(' Doctor Title: ',DTitle);
 writeln(' Doctor First Name: ',DoctorFName);
 writeln(' Doctor Last Name: ',DoctorLName);
 writeln;
 writeln('Press enter to continue');
 3:
end;
procedure ScheduleMenu;
begin
 clrscr;   {Clears the previous menu and displays the patient menu}
 writeln('  --------------------------------------------------------------------------- ');
 writeln(' |                       Welcome to the Schedule screen                      | ');
 writeln(' |                                                                           | ');
 writeln(' |   These are your current options, please choose a number when prompted    | ');
 writeln(' |                                                                           | ');
 writeln(' |   1: Add new appointment to the system                                    | ');
 writeln(' |   2: View an appointment                                                  | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln(' |                                                                           | ');
 writeln('  --------------------------------------------------------------------------- ');
 delay(500);
 gotoXY(6,13);
 write('Please select a number:');
 gotoXY(30,13);
 read(choice); {reads the choice from the cursor position which is after the please select a number}
 case choice of 1: AddAppointment;
                2: ViewAppointment;
 end;
 readln;

end;

//the print daily list module
procedure PrintDailyList;
begin
 clrscr;
 writeln('This screen will allow you to print a list of all scheduled appointment times');
 writeln;
 writeln('If you wish to view the details for an appointment please use the');
 writeln('view appointment screen located in the Appointment screen option in the');
 writeln('main menu');
 writeln;
 writeln('There are appointments booked at the following times: ');

 assign(BookedApps, 'Appointments/BookedApps.txt');
 Applist:= TStringList.Create;       //creates a T String List under the name Applist
 Applist.LoadFromFile('Appointments/BookedApps.txt');    //loads the booked times from the bookedapps file
 writeln(Applist.Text);                   //writes the booked times to the terminal
 Applist.free;                        //deletes the T String List

 writeln('Press enter when ready to continue');
 readln;



end;

//the admin module
Procedure AdminMenu;
label 1; {Skips back to admin menu}
begin
 ClrScr;
 //goto 1;   {Skips the log in system while everything is been tested}
repeat {This is an authentication system}
       writeln('Welcome to the Admin Menu, please enter your credentials to continue');
       delay(50);
       writeln('Please enter your username');
       readln(AdminUsername);
       if AdminUsername = AUsername then   {This value is a constant and can be changed at the top of the program}
          begin
          repeat
          writeln('Please enter your password');
          readln(AdminPassword);
          until AdminPassword = APassword;  {This value is a constant and can be changed at the top of the program}
          break;{needed to stop invalid username appearing with correct password}
          end
       else;
         begin
           writeln('invalid username');
           clrscr
         end;
 until AdminPassword = APassword; {Makes sure the user cant proceed until correct password has been entered}
 writeln('Credentials recognised, welcome back');

 delay(500);
 1:
 clrscr;
 writeln('                        -------------------------------- '); {Admin Menu Splashscreen}
 writeln('                       |    Welcome to the Admin menu   |');
 writeln('                       |--------------------------------|');
 writeln('                       |                                |');
 writeln('                       |                                |');
 writeln('                       |           Press Enter          |');
 writeln('                       |           To Continue          |');
 writeln('                       |                                |');
 writeln('                       |                                |');
 writeln('                       |                                |');
 writeln('                        -------------------------------- ');

 {This next set of lines replaces the text in the Admin menu with the options}
 gotoXY(26,5); {moves the cursor to the Admin menu box}
 write('1. Reset Patient ID File       |');
 delay(50); {Provides a small delay for visual effect}
 gotoXY(26,6);
 ClrEol; {This clear the Press Enter so that it can be replaced}
 writeln('2. Reset File Name File        |');
 delay(50);
 gotoXY(26,7);
 ClrEol;
 writeln('3. Initialise day              |');
 delay(50);
 gotoXY(26,8);
 ClrEol;
 writeln('4.                             |');
 delay(50);
 gotoXY(26,9);
 ClrEol;
 writeln('5. Exit to Main Menu           |');
 {This next segment of code contains the selection process}
 delay(1000);
 repeat {This works with the else}
 gotoXY(26,10);
 ClrEol;
 writeln('Please choose a number:        |');
 gotoXY(50,10); {moves the cursor to the right of the choose number line}

 read(Choice);
 case Choice of 1:        begin
                           repeat
                           writeln('warning this will reset the ID File and could result in patient files been overwritten');
                           writeln('This will also clear the filename file');
                           delay(500);   {provides delays to make sure the user really want to reset the file}
                           writeln('This is unreversible');
                           delay(500);
                           writeln('Do you still wish to continue?');
                           writeln('1: Yes');
                           writeln('2: No');
                           readln(Choice);
                           if Choice = 1 then {one been yes they want to continue}
                              begin
                              writeln('Proceeding with rewrite');  {Continues onto resetting the file}
                              end
                              else if Choice = 2 then break; {Escapes the case meaning the file is not rewritten} {nested if prevents return to main menu if invalid choice is made}
                           until Choice = 1;    {repeats until a valid choice is made}
                           assign(IDFile, 'IDFile.txt');  {makes sure the IDFile is assigned}
                           rewrite(IDFile);               {clears the IDFile}
                           writeln(IDFile, '1');          {resets the id to 1}
                           close(IDFile);                 {saves the new ID}

                           assign(FilenameFile, 'Filefile.txt');   //assigns the file name file
                           rewrite(FilenameFile);                  //clears the filename file to prevent errors with the user ID file been reset
                           close(FilenameFile);                   //closes the file name file
                           writeln('Successfully reset ID File');
                           break; {the breaks in this case are needed to exit the loop successfully}
                          end;

                        2:begin
                           repeat
                           writeln('This will clear the File Name file');
                           delay(500);    {again just makes the user pause a moment to consider whether they really want to do this}
                           writeln('This is irreversible');
                           delay(500);
                           writeln('This will result in the program been unable to display all patients made prior to the reset');
                           delay(500);
                           writeln('Are you sure you want to continue?');
                           writeln('1: Yes');
                           writeln('2: No');
                           readln(Choice);
                           if Choice = 1 then {one been yes they want to continue}
                              begin
                              writeln('Proceeding with rewrite');  {Continues onto resetting the file}
                              end
                              else if Choice = 2 then break; {Escapes the case meaning the file is not rewritten} {nested if prevents return to main menu if invalid choice is made}
                           until Choice = 1;  {repeats until a valid choice is made}
                           assign(FilenameFile, 'FileFile.txt'); {Makes sure the FileNameFile is assigned}
                           rewrite(FilenameFile); {clears the File name file}
                           close(FilenameFile);   {saves the cleared file name file}
                           writeln('Successful rewrite, returning to main menu');
                           delay(1500);
                           break;                 {exits the case and loop}
                          end;

                        3:begin
                           writeln('This will get the program ready for the day and will delete all of yesterdays appointments');
                           writeln('Are you sure you want to continue?');
                           writeln('1: Yes');
                           writeln('2: No');
                           readln(Choice); {Reads what choice the user makes}
                           if Choice = 2 then break; //leaves the procedure if the user changes their mind
                           assign(AvApps, 'Appointments/AvApps.txt');
                           rewrite(AvApps); {This next bit rewrites the available appointments list to display the complete list of available appointments}
                           writeln(AvApps, '0900am');
                           writeln(AvApps, '0930am');
                           writeln(AvApps, '1000am');
                           writeln(AvApps, '1030am');
                           writeln(AvApps, '1100am');
                           writeln(AvApps, '1130am');
                           writeln(AvApps, '1200pm');
                           writeln(AvApps, '1230pm');
                           writeln(AvApps, '0100pm');
                           writeln(AvApps, '0130pm');
                           writeln(AvApps, '0200pm');
                           writeln(AvApps, '0230pm');
                           writeln(AvApps, '0300pm');
                           writeln(AvApps, '0330pm');
                           writeln(AvApps, '0400pm');
                           writeln(AvApps, '0430pm');
                           writeln(AvApps, '0500pm');
                           writeln(AvApps, '0530pm');
                           writeln(AvApps, '0600pm');
                           writeln(AvApps, '0630pm');
                           close(AvApps);

                           assign(Appointment, 'Appointments/0900am.txt');   {This next bit creates blank text files for every appointment}
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0930am.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1000am.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1030am.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1100am.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1130am.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1200pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/1230pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0100pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0130pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0200pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0230pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0300pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0330pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0400pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0430pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0500pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0530pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0600pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(Appointment, 'Appointments/0630pm.txt');
                           rewrite(Appointment);
                           close(Appointment);

                           assign(BookedApps, 'Appointments/BookedApps.txt');  //assigns the bookings file
                           rewrite(BookedApps);                                //clears the bookings file
                           close(BookedApps);                                  //closes the bookings file

                           writeln('Finished, returning to menu');
                           delay(1500);
                           break;
                          end;
                        4:begin

                           break;
                          end;
                        5: break; {Breaks out of the procedure and loop}
                        else {This else accounts for a wrong choice by displaying a message and then resetting the line}
                          begin
                            gotoXY(26,10);
                            ClrEol;
                            write('Invalid choice, try again      |');
                            delay(1000);
                            goto 1;
                          end;
                          end;
 until Choice = 1 or 2 or 3 or 4 or 5;  {allows the loop to exit}
 end;

procedure MainMenu;  {this is the main menu procedure}
label 2;  {Used to allow other procedures to return to the main menu}
begin
 repeat
  2: {Point of return to the main menu}
  ClrScr;
  writeln('                        -------------------------------- '); {Main Menu Splashscreen}
  writeln('                       |    Welcome to the main menu    |');
  writeln('                       |--------------------------------|');
  writeln('                       |                                |');
  writeln('                       |                                |');
  writeln('                       |           Press Enter          |');
  writeln('                       |           To Continue          |');
  writeln('                       |                                |');
  writeln('                       |                                |');
  writeln('                       |                                |');
  writeln('                       |                                |');
  writeln('                        -------------------------------- ');
  readln;
  {This next set of lines replaces the text in the main menu with the options}
  gotoXY(26,5); {moves the cursor to the main menu box}
  write('1. Patient Screen              |');
  delay(50); {Provides a small delay for visual effect}
  gotoXY(26,6);
  ClrEol; {This clear the Press Enter so that it can be replaced}
  writeln('2. GP Screen                   |');
  delay(50);
  gotoXY(26,7);
  ClrEol;
  writeln('3. Appointment Screen          |');
  delay(50);
  gotoXY(26,8);
  ClrEol;
  writeln('4. Print Daily Appointment List|');
  delay(50);
  gotoXY(26,9);
  ClrEol;
  writeln('5. Exit the program            |');
  delay(50);
  gotoXY(26,10);
  ClrEol;
  writeln('6. Admin Menu                  |');
  {This next segment of code contains the selection process}
  delay(100);
  repeat {This works with the else}
  gotoXY(26,11);
  ClrEol;
  writeln('Please choose a number:        |');
  gotoXY(50,11); {moves the cursor to the right of the choose number line}
  readln(Choice);
  case Choice of 1:begin
                            PatientScreen;
                            {break the breaks in this case are needed to exit the loop successfully}
                           end;
                         2:begin
                            GPScreen;
                            break;
                           end;
                         3:begin
                            ScheduleMenu;
                            break;
                           end;
                         4:begin
                            PrintDailyList;
                            break;
                           end;
                         5: break; {Breaks out of the procedure and loop}
                         6: AdminMenu;
                         else {This else accounts for a wrong choice by displaying a message and then resetting the line}
                           begin
                             gotoXY(26,10);
                             ClrEol;
                             write('Invalid choice, try again      |');
                             delay(1000);
                           end;

                         end;
  goto 2; {This allows procedures to return to the main menu without funky formatting errors}
  until Choice = 1 or 2 or 3 or 4 or 5;  {allows the loop to exit}
  until Choice = 5; {Allows other procedure to return to the main menu}
end; {end for main menu procedure}


begin
  highvideo;
  //Addpatient;
  //patientscreen;     {These procedure calls are here for quick skip to the parts been tested, are commented out when not in use}
  //AdminMenu;
  writeln('  --------------------------------------------------------------------------- ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |=============================                 =============================| ');
  writeln(' |                               W E L C O M E                               | ');
  writeln(' |                                                                           | ');
  writeln(' |                                   SHAW                                    | ');
  writeln(' |                                  MEDICAL                                  | ');
  writeln(' |                                  SURGERY                                  | ');
  writeln(' |                                                                           | ');
  writeln(' |=============================                 =============================| ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |               |                             | ');
  writeln(' |                             |     PRESS     |                             | ');
  writeln(' |                             |     ENTER     |                             | ');
  writeln('  --------------------------------------------------------------------------- ');
  {The splash screen}
  readln;
  ClrScr; {gets rid of the splash screen}
  highvideo; {Brightens the text}
  //1:  This produced a definition error  ¯\_(ツ)_/¯
  MainMenu;
  ClrScrr;
 {The} end.
