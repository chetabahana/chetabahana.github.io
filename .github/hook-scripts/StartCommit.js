/* this script is a local start-commit hook script.
ref: https://stackoverflow.com/a/64723713/4058484 */

var fs = new ActiveXObject("Scripting.FileSystemObject");

var ForReading = 1;
var ForWriting = 2;
var objArgs, num;

objArgs = WScript.Arguments;
num = objArgs.length;
if (num !== 3)
{
    WScript.Echo("Usage: [CScript | WScript] StartCommit.js path/to/pathsfile path/to/messagefile path/to/CWD ");
    WScript.Quit(1);
}

var paths = readPaths(objArgs(0));
var message = "update " + WScript.ScriptName;
message = message + "\n\nfiles related to this commit are:\n";

for (var i = 0; i < paths.length; i++)
{
    message = message + paths[i] + "\n";
}

message = message + "\ndocumentation are available in bahasa:";
message = message + "\nhttps://github.com/chetabahana/chetabahana.github.io/wiki";
message = message + "\nhttps://github.com/chetabahana/chetabahana.github.io/wiki/Jekyll-Liquid";

var w = fs.OpenTextFile(".github/hook-scripts/git_message.txt", ForWriting);
/* WScript.Echo(message); */
w.WriteLine(message);

WScript.Quit(0);

function readPaths(path)
{
    var retPaths = [];
    if (fs.FileExists(path))
    {
        var a = fs.OpenTextFile(path, ForReading);
        while (!a.AtEndOfStream)
        {
            var line = a.ReadLine();
            retPaths.push(line);
        }
        a.Close();
    }
    return retPaths;
}