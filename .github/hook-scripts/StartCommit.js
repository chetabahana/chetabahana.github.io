/* 
this script is a local start-commit hook script.

ref: 
https://stackoverflow.com/a/64723713/4058484
https://www.robvanderwoude.com/vbstech_data_environment.php
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference
https://docs.microsoft.com/en-us/previous-versions//4yyeyb0a(v=vs.85)
*/

var line;

var ForReading = 1;
var ForWriting = 2;

var objArgs = WScript.Arguments;
var ws = new ActiveXObject("WScript.Shell");
var fs = new ActiveXObject("Scripting.FileSystemObject");

if (objArgs.length !== 3)
{
    WScript.Echo("Usage: [CScript | WScript] StartCommit.js path/to/pathsfile path/to/messagefile path/to/CWD ");
    WScript.Quit(1);
}

function readPaths(path)
{
    var retPaths = [];
    if (fs.FileExists(path))
    {
        var a = fs.OpenTextFile(path, ForReading);
        while (!a.AtEndOfStream)
        {
            line = a.ReadLine();
            retPaths.push(line);
        }
        a.Close();
    }
    return retPaths;
}

var paths = readPaths(objArgs(0));
var subject = "Update " + line;
var message = "Files related to this commit are:\n";

for (var i = 0; i < paths.length; i++)
{
    message = message + paths[i] + "\n";
}

message = message + "\nDocumentation are available in bahasa:";
message = message + "\nhttps://github.com/chetabahana/chetabahana.github.io/wiki";
message = message + "\nhttps://github.com/chetabahana/chetabahana.github.io/wiki/Jekyll-Liquid";

var w = fs.OpenTextFile(".github/hook-scripts/git_message.txt", ForWriting);
w.WriteLine(subject); w.WriteBlankLines(1); w.WriteLine(message);

WScript.Quit(0);
