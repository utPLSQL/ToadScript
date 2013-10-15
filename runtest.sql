--RUNTEST.SQL
--
--Version 1.0.5
--
--This file takes the given filename, strips off
--its directory and extension and calls utplsql.test
--or utplsql.run with the result.
--
--Changes
--Chris Rimmer  15 Feb 2002  Changed to avoid problems with 
--                           _ and % in utplsql prefix
--Chris Rimmer  19 Feb 2002  Changed to handle empty filename 
--                           more gracefully
--Chris Rimmer  07 Jun 2002  Added upper to strip prefix even 
--                           when case of file differs from 
--                           utconfig.prefix   
--Chris Rimmer  04 Mar 2004  Changed to call utplsql.run when
--                           the current file looks like a test
--                           package

set serveroutput on
set verify off

define package_to_test = &1

declare
  filename varchar2(100) := '&package_to_test';
  dot pls_integer;
  slash pls_integer;
  prefix_len pls_integer := length(utconfig.prefix);
begin

  --Strip off the directory
  slash := instr(filename, '\', -1, 1);
  if slash <> 0 then
    filename := substr(filename, slash + 1);
  end if;

  --Strip off the extension
  dot := instr(filename, '.', 1, 1);
  if dot <> 0 then
    filename := substr(filename, 1, dot - 1);
  end if;
  
  --Run the test
  if upper(substr(filename, 1, prefix_len)) = upper(utconfig.prefix) then
    utplsql.run(filename);
  else
    utplsql.test(filename);
  end if;

end;
/

pause Press any key to close

exit
