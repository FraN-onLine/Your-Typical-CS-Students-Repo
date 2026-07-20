with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Add is
   N1: Integer;
   N2: Integer;
begin
   Put ("Enter an integer value 1: ");
   Get (N1);
   Put ("Enter an integer value 2: ");
   Get (N2);

   Put (N1 + N2);
end Add;

