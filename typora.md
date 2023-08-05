# 1.  list items

To create a list with solid black dots in Typora, you can use the following steps:

1. Open Typora and create a new document or open an existing one.

2. Click on the `File` menu and select `Preferences`.

3. In the Preferences window, click on the `Appearance` tab.

4. Scroll down to the `Themes` section and click on the `Open Theme Folder` button.

5. In the theme folder, create a new file named `base.user.css` if it doesn’t already exist.

6. Open the

    

   ```
   base.user.css
   ```

    

   file in a text editor and add the following CSS code:

   ```
   ul {
       list-style-type: disc;
   }
   ```

   Save the `base.user.css` file and close it.

7. Restart Typora to apply the changes.

Now, when you create an unordered list in Typora using a hyphen (-), plus (+), or asterisk (*) followed by a space, the list items will be displayed with solid black dots. For example:

```
- Item 1
- Item 2
- Item 3
```

Will be displayed as:

- Item 1
- Item 2
- Item 3