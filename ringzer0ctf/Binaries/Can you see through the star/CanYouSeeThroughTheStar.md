#####[Can you see through the star](http://ringzer0team.com/challenges/110)
#####Answer

After running the `executable` file we understand that we need to know the text of `mask text box`. To the code of executable file we can simply use `Telerik Just Decompile app` that you can download from [here](http://www.telerik.com/products/decompiler.aspx) after installing `Just decompile app` and dragging `.exe` file in it the code will be appear.  
```
private void button1_Click(object sender, EventArgs e)
{
    this.maskedTextBox1.text = string.Concat(string.Concat(String.Concat("FLAG-", this.maskedTextBox1.Name), "vc"), this.button1.Name);
}
```
Then we'll search for `InitializeComponent` function that gives us names of `maskedTextBox1` and `button1`.  
So after all we can generate flag:
```
FLAG-maskedTextBox1vcbutton1
```

We disassemble, we hack :D
