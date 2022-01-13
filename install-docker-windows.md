# Install Docker Desktop on Windows

## 1. Check Windows version

* You must be running **Windows 10 version 2004** and **higher** (**Build 19041** and **higher**) or **Windows 11**.
* To check your Windows version and build number, press Windows logo key + R, type **winver**, press OK.
* If your Windows version is older, then update Windows to the **latest version**.

## 2. Install PowerShell and Windows Terminal

* Install **PowerShell**: [https://docs.microsoft.com/en-us/powershell](https://docs.microsoft.com/en-us/powershell)
* Install **Windows Terminal**: [https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701)

## 3. Disable Quick Edit Mode

* Disable **Quick Edit Mode** in **Command Prompt** and **Windows PowerShell**
* Open **Command Prompt (cmd)**:
* Goto Menu -> Properties -> Edit Options -> Uncheck **Quick Edit Mode**
* Goto Menu -> Defaults -> Edit Options -> Uncheck **Quick Edit Mode**
* Open **Windows PowerShell**:
* Goto Menu -> Properties -> Edit Options -> Uncheck **Quick Edit Mode**
* Goto Menu -> Defaults -> Edit Options -> Uncheck **Quick Edit Mode**

## 4. Install WSL 2

* Open **PowerShell as Administrator** and run:

    ```powershell
    wsl --install
    ```

* **Restart your machine** to complete the WSL install.
* **Ignore** or set up the newly launched (pop-up) command prompt console for Ubuntu (WSL 2 default distro) installation.
* Check WSL 2 is installed, open PowerShell and run this command:

    ```powershell
    wsl -l -v
    ```

## 5. Setup Docker Desktop

### 5.1. Install Docker Desktop

* Download and install: [https://docs.docker.com/desktop/windows/install](https://docs.docker.com/desktop/windows/install)
* When installation prompted, ensure the **Install required Windows components for WSL 2** option is selected on the Configuration page.

### 5.2. Configure Docker Desktop

* Start Docker Desktop
* Goto Settings -> General -> Check **Start Docker Desktop when you log in**
* Goto Settings -> General -> Check **Use the WSL 2 based engine**
* Goto Settings -> General -> Uncheck **Send usage statistics**
* Goto Settings -> General -> Uncheck **Show weekly tips**
* Goto Settings -> General -> Check **Use Docker Compose V2**
* Goto Settings -> Resources -> WSL INTEGRATION -> Uncheck **Enable integration with my default WSL distro**
* Goto Settings -> Docker Engine -> Add below JSON config to daemon.json:

    ```json
        "log-opts":
        {
            "max-size": "10m",
            "max-file": "5"
        },
    ```

* Finally, click on **Apply & Restart** button.
* Check Docker Desktop is running, open PowerShell and run this command:

    ```powershell
    docker ps -a
    docker info
    ```

:sparkles: :+1:

## INSTALLATION COMPLETE

---

### References

* [Which-version-of-windows-operating-system-am-i-running](https://support.microsoft.com/en-us/windows/which-version-of-windows-operating-system-am-i-running-628bec99-476a-2c13-5296-9dd081cdd808#WindowsVersion=Windows_10)
* [https://www.youtube.com/watch?v=42_ChIlJSTs](https://www.youtube.com/watch?v=42_ChIlJSTs)
* [https://github.com/microsoft/terminal/releases/latest](https://github.com/microsoft/terminal/releases/latest)
* [https://docs.microsoft.com/en-us/windows/wsl/install](https://docs.microsoft.com/en-us/windows/wsl/install)
* [https://docs.microsoft.com/en-us/windows/wsl/install-manual](https://docs.microsoft.com/en-us/windows/wsl/install-manual)
* [https://ripon-banik.medium.com/how-to-install-wsl2-offline-b470ab6eaf0e](https://ripon-banik.medium.com/how-to-install-wsl2-offline-b470ab6eaf0e)
* [https://docs.docker.com/desktop/windows/install](https://docs.docker.com/desktop/windows/install)
* [https://www.youtube.com/watch?v=lIkxbE_We1I](https://www.youtube.com/watch?v=lIkxbE_We1I)
* [https://developer.nvidia.com/cuda/wsl](https://developer.nvidia.com/cuda/wsl)
* [https://docs.docker.com/desktop/windows/wsl](https://docs.docker.com/desktop/windows/wsl)
