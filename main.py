import customtkinter as ctk
import subprocess
import json
import tkinter.messagebox as messagebox
import os
import tempfile
import urllib.request
import tempfile
import sys

# Always load applications.json from the script directory (works with PyInstaller too)
def resource_path(relative_path):
    try:
        # PyInstaller creates a temp folder and stores path in _MEIPASS
        base_path = sys._MEIPASS
    except Exception:
        base_path = os.path.abspath(os.path.dirname(__file__))
    return os.path.join(base_path, relative_path)


with open(resource_path('applications.json'), encoding='utf-8') as f:
    app_data = json.load(f)

PROGRAMS = []
for key, val in app_data.items():
    name = val.get('content', key)
    desc = val.get('description', '')
    category = val.get('category', 'Other')
    sources = []
    if val.get('winget') and val['winget'].lower() != 'na':
        sources.append({'type': 'winget', 'id': val['winget']})
    if val.get('choco') and val['choco'].lower() != 'na':
        sources.append({'type': 'choco', 'id': val['choco']})
    if val.get('download'):
        sources.append({'type': 'installer', 'url': val['download']})
    PROGRAMS.append({'category': category, 'name': name, 'desc': desc, 'sources': sources})

class InstallerApp(ctk.CTk):
    def __init__(self):
        super().__init__()
        self.title('Program Installer')
        self.geometry('900x700')
        self.resizable(False, True)
        try:
            icon_path = resource_path('orange.ico')
            self.iconbitmap(icon_path)
        except Exception as e:
            print(f"Warning: Could not set window icon: {e}")
        try:
            self.iconbitmap(resource_path('orange.ico'))
        except Exception as e:
            print(f"Warning: Could not set window icon: {e}")
        self.all_sources = set()
        for prog in PROGRAMS:
            for s in prog['sources']:
                self.all_sources.add(s['type'])
        self.all_sources = sorted(list(self.all_sources))
        self.selected_source = ctk.StringVar(value=self.all_sources[0] if self.all_sources else '')
        self.build_ui()

    def update_winget_client(self):
        cmd = 'winget install --id Microsoft.DesktopAppInstaller --source winget --silent --accept-package-agreements --accept-source-agreements'
        powershell_cmd = f'start powershell -NoExit -Command "{cmd}"'
        try:
            subprocess.Popen(powershell_cmd, shell=True)
            messagebox.showinfo("Winget Client Update Started", "Started updating winget client in a new terminal window.")
        except Exception as e:
            messagebox.showerror("Winget Client Update Failed", f"Failed to start winget client update: {e}")

    def refresh_winget_sources(self):
        cmd = 'winget source update'
        powershell_cmd = f'start powershell -NoExit -Command "{cmd}"'
        try:
            subprocess.Popen(powershell_cmd, shell=True)
            messagebox.showinfo(
                "Winget Sources Refresh Started",
                "Started refreshing winget sources in a new terminal window.\n\nIf you see 'Cancelled' or 0%, please ensure no other winget process is running, check your network connection, and try again. This is a known issue with winget and not your script."
            )
        except Exception as e:
            messagebox.showerror("Winget Sources Refresh Failed", f"Failed to refresh winget sources: {e}")

    def reset_winget_sources(self):
        cmd = 'winget source reset --force'
        powershell_cmd = f'start powershell -NoExit -Command "{cmd}"'
        try:
            subprocess.Popen(powershell_cmd, shell=True)
            messagebox.showinfo(
                "Winget Sources Reset Started",
                "Started resetting winget sources in a new terminal window.\n\nAfter this completes, try 'Refresh Winget Sources' again. If you still see errors, update the Winget Client."
            )
        except Exception as e:
            messagebox.showerror("Winget Sources Reset Failed", f"Failed to reset winget sources: {e}")

    def install_chocolatey(self):
        ps_script = r'''
        $ErrorActionPreference = 'Stop'
        Write-Host "Checking if Chocolatey is Installed..."
        if (Get-Command choco -ErrorAction SilentlyContinue) {
            Write-Host "Chocolatey is already installed."
            exit 0
        }
        Write-Host "Seems Chocolatey is not installed, installing now."
        Set-ExecutionPolicy Bypass -Scope Process -Force;
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        '''
        with tempfile.NamedTemporaryFile('w', delete=False, suffix='.ps1') as f:
            f.write(ps_script)
            ps1_path = f.name
        powershell_cmd = f'start powershell -NoExit -File "{ps1_path}"'
        try:
            subprocess.Popen(powershell_cmd, shell=True)
            messagebox.showinfo("Chocolatey Install Started", "Started Chocolatey installation in a new terminal window. If Chocolatey is already installed, nothing will change.")
        except Exception as e:
            messagebox.showerror("Chocolatey Install Failed", f"Failed to start Chocolatey install: {e}")

    def build_ui(self):
        ctk.set_default_color_theme("dark-blue")
        self.configure(bg="#222222")
        self.page_size = 20
        self.current_page = 0
        if hasattr(self, 'source_frame'):
            self.source_frame.destroy()
        self.source_frame = ctk.CTkFrame(self, fg_color="#222222", width=180)
        self.source_frame.grid(row=0, column=0, rowspan=2, sticky='nsw', padx=(10, 0), pady=10)
        self.source_frame.grid_propagate(False)
        ctk.CTkLabel(self.source_frame, text="Select Source:", font=("Arial", 15, 'bold'), text_color="#ff8800", bg_color="#222222").pack(pady=(10, 5))
        self.source_vars = {}
        for src in self.all_sources:
            var = ctk.BooleanVar(value=True)
            self.source_vars[src] = var
            label = src.capitalize() if src != 'installer' else 'Source Installer'
            ctk.CTkCheckBox(
                self.source_frame,
                text=label,
                variable=var,
                command=self._draw_page,
                fg_color="#292929",
                border_color="#ff8800",
                checkmark_color="#ff8800",
                text_color="#dddddd"
            ).pack(anchor='w', padx=20, pady=2)
        if hasattr(self, 'search_frame'):
            self.search_frame.destroy()
        self.search_frame = ctk.CTkFrame(self, fg_color="#222222")
        self.search_frame.grid(row=0, column=1, sticky='ew', padx=10, pady=(10, 0))
        self.grid_rowconfigure(0, weight=0)
        self.grid_columnconfigure(1, weight=1)
        self.search_frame.grid_columnconfigure(0, weight=1)
        self.search_frame.grid_columnconfigure(1, weight=0)
        self.search_var = ctk.StringVar()
        self.search_entry = ctk.CTkEntry(self.search_frame, textvariable=self.search_var, width=400, placeholder_text="Search programs...")
        self.search_entry.grid(row=0, column=0, padx=(0, 10), pady=5, sticky='ew')
        self.search_entry.bind('<Return>', lambda event: self._draw_page())
        search_btn = ctk.CTkButton(self.search_frame, text='Search', command=self._draw_page, fg_color="#ff8800", hover_color="#ff9900", text_color="#222222", width=100)
        search_btn.grid(row=0, column=1, padx=5, pady=5)
        choco_btn = ctk.CTkButton(self.search_frame, text='Install Chocolatey', command=self.install_chocolatey, fg_color="#6e4b1f", hover_color="#8a5c25", text_color="#ffffff", width=160)
        choco_btn.grid(row=0, column=2, padx=5, pady=5)
        self._draw_page()

    def _draw_page(self):
        if hasattr(self, 'scrollable_frame'):
            self.scrollable_frame.destroy()
        self.scrollable_frame = ctk.CTkScrollableFrame(self, width=720, height=650, fg_color="#222222")
        self.scrollable_frame.grid(row=1, column=1, sticky='nsew', padx=10, pady=10)
        from collections import defaultdict
        grouped = defaultdict(list)
        query = self.search_var.get().strip().lower() if hasattr(self, 'search_var') else ''
        selected_sources = [src for src, var in self.source_vars.items() if var.get()]
        for prog in PROGRAMS:
            if not any(s['type'] in selected_sources for s in prog['sources']):
                continue
            if not query or query in prog['name'].lower() or query in prog['desc'].lower() or query in prog['category'].lower():
                cat = prog['category'].strip().capitalize()
                grouped[cat].append(prog)
        flat_list = []
        for cat in sorted(grouped):
            flat_list.append({'is_category': True, 'cat': cat})
            for prog in grouped[cat]:
                flat_list.append({'is_category': False, 'prog': prog})
        total = len(flat_list)
        start = self.current_page * self.page_size
        end = min(start + self.page_size, total)
        row = 0
        for item in flat_list[start:end]:
            if item.get('is_category'):
                label = ctk.CTkLabel(self.scrollable_frame, text=item['cat'], font=("Arial", 20, 'bold'), text_color="#ff8800", bg_color="#222222")
                label.grid(row=row, column=0, columnspan=3, pady=(30, 10), sticky='w')
                row += 1
            else:
                prog = item['prog']
                card = ctk.CTkFrame(self.scrollable_frame, fg_color="#292929", border_color="#ff8800", border_width=2, corner_radius=12)
                card.grid(row=row, column=0, columnspan=3, sticky='ew', padx=10, pady=10)
                card.grid_columnconfigure(0, weight=1)
                card.grid_columnconfigure(1, weight=0)
                name_label = ctk.CTkLabel(card, text=prog['name'], font=("Arial", 18, 'bold'), text_color="#ff8800", bg_color="#292929")
                name_label.grid(row=0, column=0, sticky='w', padx=16, pady=(10, 0))
                desc_label = ctk.CTkLabel(card, text=prog['desc'], font=("Arial", 14), text_color="#dddddd", wraplength=400, justify='left', bg_color="#292929")
                desc_label.grid(row=1, column=0, sticky='w', padx=16, pady=(0, 10))
                source = next((s for s in prog['sources'] if s['type'] in selected_sources), None)
                def do_action(prog=prog, source=source):
                    if source['type'] == 'winget':
                        self.winget_install(source['id'], prog['name'])
                    elif source['type'] == 'choco':
                        self.choco_install(source['id'], prog['name'])
                    elif source['type'] == 'installer':
                        self.download_and_run_installer(source['url'], prog['name'])
                action_btn = ctk.CTkButton(card, text='Install/Download', fg_color="#ff8800", hover_color="#ff9900", text_color="#222222", font=("Arial", 14, 'bold'), width=150, height=40, command=do_action)
                action_btn.grid(row=0, column=1, rowspan=2, padx=10, pady=10, sticky='e')
                row += 1
        nav_frame = ctk.CTkFrame(self.scrollable_frame, fg_color="#222222")
        nav_frame.grid(row=row, column=0, columnspan=3, pady=10)
        prev_btn = ctk.CTkButton(nav_frame, text='Previous', command=self._prev_page, fg_color="#ff8800", hover_color="#ff9900", text_color="#222222", width=100)
        prev_btn.pack(side='left', padx=10)
        page_label = ctk.CTkLabel(nav_frame, text=f"Page {self.current_page+1} / {((total-1)//self.page_size)+1}", font=("Arial", 14), text_color="#ff8800", bg_color="#222222")
        page_label.pack(side='left', padx=10)
        next_btn = ctk.CTkButton(nav_frame, text='Next', command=self._next_page, fg_color="#ff8800", hover_color="#ff9900", text_color="#222222", width=100)
        next_btn.pack(side='left', padx=10)
        prev_btn.configure(state='normal' if self.current_page > 0 else 'disabled')
        next_btn.configure(state='normal' if end < total else 'disabled')

    def winget_install(self, pkg_id, prog_name):
        cmd = f'winget install --id "{pkg_id}" --silent --accept-package-agreements --accept-source-agreements'
        powershell_cmd = f'start powershell -NoExit -Command "{cmd}"'
        try:
            subprocess.Popen(powershell_cmd, shell=True)
            messagebox.showinfo("Winget Installation Started", f"Started installation of {prog_name} using winget in a new terminal window.")
        except Exception as e:
            messagebox.showerror("Winget Installation Failed", f"Failed to start installation for {prog_name}: {e}")

    def choco_install(self, pkg_id, prog_name):
        cmd = f'choco install {pkg_id} -y'
        powershell_cmd = f'start powershell -NoExit -Command "{cmd}"'
        try:
            subprocess.Popen(powershell_cmd, shell=True)
            messagebox.showinfo("Choco Installation Started", f"Started installation of {prog_name} using Chocolatey in a new terminal window.")
        except Exception as e:
            messagebox.showerror("Choco Installation Failed", f"Failed to start installation for {prog_name}: {e}")

    def download_and_run_installer(self, url, prog_name):
        try:
            temp_dir = tempfile.gettempdir()
            filename = os.path.basename(url.split('?')[0])
            if not filename.lower().endswith(('.exe', '.msi')):
                filename += '.exe'  # fallback
            dest_path = os.path.join(temp_dir, filename)
            messagebox.showinfo("Downloading", f"Downloading installer for {prog_name}...\nThis may take a moment.")
            urllib.request.urlretrieve(url, dest_path)
            messagebox.showinfo("Download Complete", f"Downloaded {prog_name} installer. Launching now.")
            subprocess.Popen(f'start "" "{dest_path}"', shell=True)
        except Exception as e:
            messagebox.showerror("Installer Download Failed", f"Failed to download or launch installer for {prog_name}: {e}")

    def _prev_page(self):
        if self.current_page > 0:
            self.current_page -= 1
            self._draw_page()

    def _next_page(self):
        from collections import defaultdict
        grouped = defaultdict(list)
        for prog in PROGRAMS:
            cat = prog['category'].strip().capitalize()
            grouped[cat].append(prog)
        flat_list = []
        for cat in sorted(grouped):
            flat_list.append({'is_category': True, 'cat': cat})
            for prog in grouped[cat]:
                flat_list.append({'is_category': False, 'prog': prog})
        total = len(flat_list)
        if (self.current_page + 1) * self.page_size < total:
            self.current_page += 1
            self._draw_page()

if __name__ == '__main__':
    app = InstallerApp()
    app.mainloop()
