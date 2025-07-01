1. **Download the corresponding files**  
    - `csv_[version].zip`  
    - `mobmania.[version].zip`  

2. **Locate the game installation folder**  
    - *Method 1 (Steam)*:  
      Right-click the game in Steam → `Manage` → `Browse local files`  
    - *Method 2 (Manual)*:  
      Go to `X:\steam\steamapps\common\Mobmania`  

3. **Install CSV localization files**  
    - Extract `csv_[version].zip`  
    - Replace files in game directory  
      > (Optional) For partial localization:  
      > Only replace e_desc.csv for item descriptions  
      > Other CSV files (`e_name.csv`, `t_name.csv`, `t_desc.csv`) can be skipped  

4. **Install core patch files**  
    - Extract `mobmania.[version].zip` to game folder  
    - Should contain these files:  
      ```
      .
      ├── Install.bat
      ├── bspatch.exe
      ├── data.patch
      └── data.win
      ```

5. **Run the installer**  
   - Execute `Install.bat`  
   - Wait for "Complete" prompt  

6. **Important notes**  
    If you don't execute the previous step  
    e_name.csv,t_name.csv,t_desc.csv's Chinese won't display properly  
    If you did execute it, decide whether to replace them as needed


**Something**  
1. During the execution of `Install.bat`, a backup of the original `data.win` file will be created as `data.win.bak`. If you encounter issues like the game failing to run after execution, please delete the `data.win` file and rename `data.win.bak` back to `data.win`.  
2. If you've run `Install.bat` multiple times, right-click the game in Steam:  
   `Properties` → `Installed Files` → `Verify integrity of game files`.  
3. Due to missing font libraries, some characters may still not display properly (e.g., 瘴, 骷髅, 莴苣, 哔, etc.). These have been replaced with alternative terms (though for terms like "打嗝", there's no ideal way to handle them).  
4. I take no responsibility for any consequences arising from using this localization method.    
5. Some texts might be incorrectly localized or remain untranslated due to my laziness. I usually wait for the next game update to address them.  
6. GitHub provides a method for self-localization (Chinese version only), allowing you to localize the game yourself even if I'm no longer around.  
7. Personally, I prefer not to localize character names.  