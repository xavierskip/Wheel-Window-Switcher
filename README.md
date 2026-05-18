# Wheel Window Switcher (Cylinder)

**[中文](#中文) | [English](#english)**

---

## 中文

### 简介

**Cylinder** 是一个轻量级的 AutoHotkey v2.0 脚本，让你可以通过 **快捷键 + 滚轮** 快速切换显示窗口。

### 功能特性

- **鼠标滚轮切换**：向下滚动将当前窗口沉底，向上滚动将底层窗口置顶。
- **循环切换**：上下滚轮互为反向操作，循环操作更灵活。
- **多显示器支持**：只在鼠标所在显示器上的窗口间切换。

### 使用方法

| 快捷键 | 功能 |
|--------|------|
| `Alt + Shift + 滚轮向下` | 当前窗口沉底，激活下一个窗口 |
| `Alt + Shift + 滚轮向上` | 将底层窗口激活置顶 |

### 安装要求

- **AutoHotkey v2.0 或更高版本**
- 下载地址：https://www.autohotkey.com/

### 安装步骤

1. 安装 AutoHotkey v2.0
2. 下载 `cylinder.ahk` 脚本文件
3. 双击运行脚本（或将其放入启动文件夹实现开机自启）

### 开机自启设置

将 `cylinder.ahk` 的快捷方式放入以下目录：

```
%AppData%\Microsoft\Windows\Start Menu\Programs\Startup
```

### 以 UI Access 运行

如果你遇到了某些窗口失效的情况，因为权限的关系，你需要以`UI Access`的方式运行脚本。

1. 首先 AutoHotkey 安装模式选择`All users`，这样你的安装路径是`C:\Program Files\AutoHotkey`

2. 安装完毕后，打开`AutoHotkey Dash`，选择`Lanuch settings`，将`UI Access`勾选上。

3. 正常运行脚本或者鼠标邮件点击`Run with UI access`。

### F&Q

- **为什么要使用 `Alt + Shift + 滚轮` 作为快捷键？**

  本想 `Win + Shift + 滚轮` 作为快捷键，但在某些情况下上会触发 [Office 网页弹窗](https://go.microsoft.com/fwlink/?linkid=2044481)。遂改用了`Alt + Shift + 滚轮`作为快捷键。

  同时，可以根据[Hotkeys 文档](https://www.autohotkey.com/docs/v1/Hotkeys.htm)自行修改绑定快捷键。

> [!TIP]
> `Ctrl` + 鼠标滚轮常用于浏览器的页面缩放，所以`Ctrl`按键在这里不适合作为快捷键的一部分。


- **哪些窗口会参与循环切换？**

  同时满足以下条件的窗口才会被纳入切换列表：
  - 窗口有标题（排除隐藏的后台程序）
  - 不是工具窗口（如浮动工具栏）
  - 窗口中心点位于鼠标当前所在的显示器内

  最小化的窗户不在切换到范围之内。

> [!WARNING]  
> 任务管理器等窗口会干扰此脚本的运行，应该是受到权限的影响。处理方法请参考 [以 UI Access 运行](#以-UI-Access-运行)

### 许可证

MIT License - 可自由使用和修改

---

## English

### Introduction

**Cylinder** is a lightweight AutoHotkey v2.0 script that lets you quickly switch between visible windows using a **hotkey + mouse wheel** combination.

### Features

- **Mouse Wheel Switching**: Scroll down to send the current window to the back, scroll up to bring the bottom window to the front.
- **Cyclic Switching**: Up and down scrolling are reverse operations of each other, making window cycling more flexible.
- **Multi-Monitor Support**: Only switches between windows on the monitor where your mouse is currently located.

### Usage

| Shortcut | Function |
|----------|----------|
| `Alt + Shift + Wheel Down` | Send current window to back, activate next window |
| `Alt + Shift + Wheel Up` | Bring the bottom-most window to the front |

### Requirements

- **AutoHotkey v2.0 or higher**
- Download: https://www.autohotkey.com/

### Installation

1. Install AutoHotkey v2.0
2. Download the `cylinder.ahk` script file
3. Double-click to run the script (or place it in your Startup folder for automatic launch)

### Auto-Start Setup

Create a shortcut to `cylinder.ahk` and place it in:

```
%AppData%\Microsoft\Windows\Start Menu\Programs\Startup
```

### Run with UI Access

If you encounter issues with certain windows not working due to permission restrictions, you need to run the script with `UI Access`.

1. First, select `All users` as the installation mode for AutoHotkey, so that your installation path is `C:\Program Files\AutoHotkey`.

2. After installation, open `AutoHotkey Dash`, select `Launch settings`, and check the `UI Access` option.

3. Run the script normally, or right-click and select `Run with UI access`.

### F&Q

- **Why use `Alt + Shift + Wheel` as the shortcut?**

  We originally wanted to use `Win + Shift + Wheel` as the shortcut, but in some cases it triggers [Office web popups](https://go.microsoft.com/fwlink/?linkid=2044481). So we switched to `Alt + Shift + Wheel` instead.

  You can also customize the hotkey by referring to the [Hotkeys documentation](https://www.autohotkey.com/docs/v1/Hotkeys.htm).

> [!TIP]
> `Ctrl` + mouse wheel is commonly used for page zooming in browsers, so the `Ctrl` key is not suitable as part of a shortcut here.

- **Which windows are included in the cycle?**

  Only windows that meet all of the following conditions are included in the switching list:
  - Windows with a title (excludes hidden background processes)
  - Not tool windows (such as floating toolbars)
  - Window center point is located on the monitor where the mouse currently is

  Minimized windows are not included in the switching scope.

> [!WARNING]  
> Windows such as Task Manager may interfere with the execution of this script, likely due to permission restrictions. For a solution, please refer to [Run with UI Access](#Run-with-UI-Access).

### License

MIT License - Free to use and modify

---

Made with AutoHotkey v2.0
