program tell_book;

Uses Crt;

var
    name,family,phone,stu_id,result,answer,ans,sch,fl,sb,sr,up,fn,ln,n,fam:string[19];
    i,int:longint;
    flag,found,newsearch,del:boolean;
    F,F2:text;

{+++++++++++++++++++++++++++++++++++++++++++}
function space (x:string):string;
  begin
    result:='';
    int:=20-length(x);
    for i:=1 to int do
    	result := result + ' ';
    space := result;
  end;
{+++++++++++++++++++++++++++++++++++++++++++}
procedure list;

 begin
     clrscr;
     textcolor(10);
     writeln('********************************************************************************');
     writeln('*                                   View All                                   *');
     writeln('********************************************************************************');
     textcolor(14);
     writeln('First Name          Last Name           Phone               Student ID          ');
     textcolor(10);
     writeln('********************************************************************************');
     textcolor(15);

     assign(F,'db.txt');
     reset(F);

     while not eof(f) do

         begin

             readln(F,name);
             readln(F,family);
             readln(F,phone);
             readln(F,stu_id);

             write(name);
             write(space(name));

             write(family);
             write(space(family));

             write(phone);
             write(space(phone));

             writeln(stu_id);

             writeln('--------------------------------------------------------------------------------');

         end;

     close(F);

     writeln;writeln;
     write('Press Enter to Back Main Page >>');
     readln;
 end;
{+++++++++++++++++++++++++++++++++++++++++++}
procedure add;

 begin

   Repeat

     clrscr;
     textcolor(10);
     writeln('********************************************************************************');
     writeln('*                                   Add New Contact                            *');
     writeln('********************************************************************************');

     assign(F,'db.txt');

     writeln;

     textcolor(11);
     write('                              ');
     write('First Name : ');

     textcolor(15);
     readln(name);
     writeln;

     textcolor(11);
     write('                              ');
     write('Last Name  : ');

     textcolor(15);
     readln(family);
     writeln;

     textcolor(11);
     write('                              ');
     write('Phone      : ');

     textcolor(15);
     readln(phone);
     writeln;

     textcolor(11);
     write('                              ');
     write('Student ID   : ');

     textcolor(15);
     readln(stu_id);

     append(F);

     writeln(F,name);
     writeln(F,family);
     writeln(F,phone);
     writeln(F,stu_id);

     close(f);

     writeln;writeln;
     textcolor(12);
     write('                             ');
     writeln('*** Successfully added ***');
     writeln;

     Repeat

       i:=0;

       writeln;
       textcolor(15);
       write('                               ');
       write('Add New Contact y/n ? ');

       readln(answer);

       ans:=UpCase(answer);

         case ans of

           'Y':flag:=false;
           'N':flag:=true;

         otherwise

            begin

              i:=1;

              writeln;
              textcolor(12);
              write('                          ');
              writeln('*** Please Enter Valid Value *** ');

            end;

        end;{ end of case }

     Until(i=0);

   Until(flag=true);

  writeln;writeln;writeln;
  writeln('Press Enter to Back Main Page >>');
  readln;

 end;
{+++++++++++++++++++++++++++++++++++++++++++}
procedure search;

 begin

  Repeat

     clrscr;
     assign(F,'db.txt');

     gotoxy(1,10);
     textcolor(10);
     writeln('********************************************************************************');
     writeln('*                            Search The Phone Book                             *');
     writeln('********************************************************************************');
     writeln;

     Repeat

         i:=0;

         textcolor(14);
         writeln;
         write('         ');
         write('Search by : name/family/phone/id ? ');
         textcolor(15);

         readln(sb);
         sb:=UpCase(sb);

         if (sb<>'NAME') AND (sb<>'FAMILY') AND (sb<>'PHONE') AND (sb<>'ID') then

            begin

              i:=1;

              writeln;
              textcolor(12);
              write('                          ');
              writeln('*** Please Enter Valid Value *** ');

            end;

     Until(i=0);


     clrscr;
     gotoxy(1,10);
     textcolor(10);
     writeln('********************************************************************************');
     writeln('*                            Search The Phone Book                             *');
     writeln('********************************************************************************');

     gotoxy(9,14);
     textcolor(14);
     write('Please Enter ',sb,' For Searching : ');

     textcolor(15);
     readln(sch);
     sch:=UpCase(sch);

     flag:=false;

     clrscr;
     textcolor(10);
     writeln('********************************************************************************');
     writeln('*                                Result Search                                 *');
     writeln('********************************************************************************');
     textcolor(14);
     writeln('First Name          Last Name           Phone               Student ID          ');
     textcolor(10);
     writeln('********************************************************************************');
     textcolor(15);

     reset(F);

     while not eof(F) do

         begin

             readln(F,name);
             readln(F,family);
             readln(F,phone);
             readln(F,stu_id);

             {+++++++++}
             if sb='NAME' then

               sr:=UpCase(name)

             else if sb='FAMILY' then

                sr:=UpCase(family)

             else if sb='PHONE' then

                sr:=UpCase(phone)

             else

                 sr:=UpCase(stu_id);
             {+++++++++}

             if pos(sch,sr)>0 then

              begin

               write(name);
               write(space(name));

               write(family);
               write(space(family));

               write(phone);
               write(space(phone));

               writeln(stu_id);

               writeln('--------------------------------------------------------------------------------');

               flag:=true;

              end;

         end;

     close(F);

     if flag=false then

      begin

       writeln;
       textcolor(12);
       write('                                ');
       writeln('*** Not Found ***');

      end;

      Repeat

       i:=0;

       writeln;
       textcolor(11);
       write('                               ');
       write('New Searching y/n ? ');

       textcolor(15);
       readln(answer);

       ans:=UpCase(answer);

         case ans of

           'Y':flag:=false;
           'N':flag:=true;

         otherwise

            begin

              i:=1;

              writeln;
              textcolor(12);
              write('                          ');
              writeln('*** Please Enter Valid Value *** ');

            end;

        end;{ end of case }

     Until(i=0);

  Until(flag=true);

  writeln;writeln;writeln;
  writeln('Press Enter to Back Main Page >>');
  readln;

 end;
{+++++++++++++++++++++++++++++++++++++++++++}
procedure delete;

 begin


  Repeat


     clrscr;
     gotoxy(1,8);
     textcolor(12);
     writeln('********************************************************************************');
     writeln('*                               Delete a Contact                               *');
     textcolor(11);
     writeln('********************************************************************************');
     writeln('*                        Enter First Name And Last Name                        *');
     writeln('********************************************************************************');

     gotoxy(9,14);
     textcolor(14);
     write('                    ');
     write('First Name : ');
     textcolor(15);

     readln(fn);
     fn:=UpCase(fn);

     writeln;
     textcolor(14);
     write('                            ');
     write('Last Name  : ');
     textcolor(15);

     readln(ln);
     ln:=UpCase(ln);

     assign(F,'db.txt');
     assign(F2,'temp.txt');

     reset(F);

     found:=false;

     while not eof(F) do

         begin

             readln(F,name);
             readln(F,family);
             readln(F,phone);
             readln(F,stu_id);

             sr:=UpCase(name);
             up:=Upcase(family);

             if (sr=fn) AND (up=ln) then

              begin

                 n:=name;
                 fam:=family;

                 clrscr;

                 found:=true;

                 writeln;writeln;
                 textcolor(10);
                 writeln('********************************************************************************');
                 writeln('*                                Contact Found                                 *');
                 writeln('********************************************************************************');

                 textcolor(15);
                 writeln('|');
                 writeln('| First Name : ',name);

                 writeln('--------------------------------------------------------------------------------');

                 writeln('| Last Name  : ',family);

                 writeln('--------------------------------------------------------------------------------');

                 writeln('| Phone      : ',phone);

                 writeln('--------------------------------------------------------------------------------');

                 writeln('| Student ID   : ',stu_id);
                 writeln('|');

                 textcolor(10);
                 writeln('********************************************************************************');

              end;
         end;

     close(F);

     if found=true then

       begin

             Repeat

                i:=0;

                writeln;
                textcolor(14);
                write('                               ');
                write('Are You Sure y/n ? ');

                readln(answer);

                ans:=UpCase(answer);

                case ans of

                   'Y':del:=true;
                   'N':del:=false;

                otherwise

                    begin

                      i:=1;

                      writeln;
                      textcolor(12);
                      write('                          ');
                      writeln('*** Please Enter Valid Value *** ');

                    end;

                end;{ end of case }

             Until(i=0);


             if del=false then

               begin

                   textcolor(11);
                   writeln;
                   write('                                ');
                   writeln('cancel opearation');
                   newsearch:=false;

               end

             else

               begin

                    { read db.txt And write to temp.txt }

                    reset(F);
                    rewrite(F2);

                    while not eof(F) do

                       begin

                         readln(F,name);
                         readln(F,family);
                         readln(F,phone);
                         readln(F,stu_id);

                         if (name<>n) AND (family<>fam) then

                            begin

                               writeln(F2,name);
                               writeln(F2,family);
                               writeln(F2,phone);
                               writeln(F2,stu_id);


                            end;

                       end;

                    close(F2);
                    close(F);

                    { read temp.txt And write to db.txt }

                    reset(F2);
                    rewrite(F);

                    while not eof(F2) do

                       begin

                         readln(F2,fl);

                         writeln(F,fl);

                       end;

                    close(F);
                    close(F2);

                    { delete temp.txt }

                    erase(F2);

                    writeln;
                    textcolor(10);
                    write('                           ');
                    writeln('*** Successfully Deleted *** ');
                    newsearch:=false;

               end;

       end;

     if found=false then

        begin

         clrscr;
         gotoxy(1,13);
         textcolor(12);
         writeln('********************************************************************************');
         writeln('*                                    Not Found                                 *');
         writeln('********************************************************************************');
         textcolor(15);

         Repeat

           i:=0;

           writeln;
           textcolor(14);
           write('                               ');
           write('New Searching y/n ? ');

           readln(answer);

           ans:=UpCase(answer);

           case ans of

              'Y':newsearch:=true;
              'N':newsearch:=false;

           otherwise

               begin

                 i:=1;

                 writeln;
                 textcolor(12);
                 write('                          ');
                 writeln('*** Please Enter Valid Value *** ');

               end;

           end;{ end of case }

         Until(i=0);

        end;

  Until newsearch=false;

     textcolor(15);
     writeln;writeln;writeln;
     writeln('Press Enter to Back Main Page >>');
     readln;

 end;
{+++++++++++++++++++++++++++++++++++++++++++}
procedure clear;

 begin
    clrscr;
    gotoxy(1,10);
    textcolor(12);
    writeln('********************************************************************************');
    writeln('*                              Clear All Contact                               *');
    writeln('********************************************************************************');
    writeln;
    gotoxy(1,14);

    Repeat

      i:=0;
      textcolor(14);
      write('                             ');
      Write('Are You Sure y/n ? ');
      textcolor(15);
      readln(answer);
      ans:=UpCase(answer);

      if ans='Y' then
        begin

            assign(F,'db.txt');
            rewrite(F);
            close(F);
            textcolor(10);
            writeln;writeln;
            write('                            ');
            write('Successfully completed');

        end

      else if ans='N' then
         begin

          writeln;writeln;
          textcolor(11);
          write('                              ');
          write('cancel operation');

         end

      else
         begin

          i:=1;
          writeln;
          textcolor(12);
          write('                           ');
          writeln('Please Enter Valid Value.');
          writeln;

         end;

    Until(i=0);

    writeln;writeln;writeln;writeln;
    textcolor(15);
    writeln('Press Enter to Back Main Page >>');
    readln;

 end;
{+++++++++++++++++++++++++++++++++++++++++++}
procedure start;

 begin

  Repeat

    clrscr;
    flag:=false;
    textcolor(10);
    writeln('********************************************************************************');
    writeln('*                     This Program Write By Meysam Davoudi                     *');
    writeln('********************************************************************************');
    textcolor(14);
    write('* ');
    textcolor(13);
    write('Istanbul Okan University - 223307003');
    textcolor(14);
    writeln('                                         *');
    writeln('* View All                :LIST                                                *');
    writeln('* Add New                 :ADD                                                 *');
    writeln('* Search The Phone Book   :SEARCH                                              *');
    writeln('* Delet a Contact         :DELETE                                              *');
    writeln('* Clear All Contacts      :CLEAR                                               *');
    writeln('* Exit The Program        :EXIT Or Press ESC Key                               *');
    writeln('*                                                                              *');
    writeln('********************************************************************************');

    writeln;

    Repeat
       flag:=true;
       writeln;
       textcolor(15);
       write('  LIST / ADD / SEARCH / DELETE / CLEAR / EXIT ? ');

       ans:=readkey;

       if ans=#27 then halt; { #27 = ESC }

       if ans<>#13 then { #13 = Enter }

         begin

           write(ans);
           readln(answer);
           ans:=UpCase(concat(ans,answer));

         end

       else writeln;

        case ans of

           'LIST':list;
           'ADD':add;
           'SEARCH':search;
           'DELETE':delete;
           'CLEAR':clear;
           'EXIT':i:=0;

         otherwise

            begin

              flag:=false;
              writeln;
              textcolor(12);
              write('                    ');
              writeln('*** Please Enter Valid Value *** ');
            end;

        end;

     Until(flag=true);

  until (ans='EXIT');

 end;
{+++++++++++++++++++++++++++++++++++++++++++}
Begin
start;
end.
