#load "../tools/ump.csx"

using System.IO;

class AfqmLoader : UMPLoader
{
    public override string CodePath => "../mods/";
    public override bool UseGlobalScripts => true;

    public override string[] GetCodeNames(string filePath)
    {
        return new string[] { Path.GetFileNameWithoutExtension(filePath) };
    }

    public AfqmLoader(UMPWrapper wrapper) : base(wrapper)
    {
    }
}

AfqmLoader loader = new AfqmLoader(UMP_WRAPPER);
loader.Load();

