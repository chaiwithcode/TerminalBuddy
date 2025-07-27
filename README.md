# TerminalBuddy — Apple Intelligence in Your Terminal

**TerminalBuddy** A command-line tool that brings Apple’s Foundation Models framework directly to your terminal. Designed for macOS Sequoia and later, it enables seamless, on-device AI interactions—no app switching needed. Ideal for developers, power users, and anyone immersed in terminal-driven workflows, it puts intelligent assistance right where you work: in the command line.

---

## Screenshot

<p align="center">
  <img src="https://github.com/user-attachments/assets/6a08ef00-43f3-40a5-8a33-2649c5e518f6" alt="TerminalBuddy Chat" />
</p>


---

## Features

- **Native On-Device AI**  
  Leverages Apple’s Foundation Models to run powerful AI directly on your Mac—no internet connection, cloud dependency, or latency. Your data stays private and secure.

- **Seamless Terminal Chat**  
  Interact with Apple Intelligence directly from your terminal, making it ideal for multitasking or integration with terminal-based apps.

- **Streaming & Structured Output**  
  Choose real-time streaming responses for live feedback, or opt for complete, structured replies—ideal for scripting and automation.

- **No App Switching**  
  Stay focused in your terminal workflow — no need to bounce between apps or interfaces..

- **Flexible Interaction Modes**  
  Switch effortlessly between modes using intuitive CLI flags or interactive prompts, tailored to your task and preferences.

---

## Requirements

- macOS Tahoe Beta or newer  
- Xcode 26.0 Beta (for building)  
- Device with Apple Intelligence enabled  

---

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/chaiwithcode/TerminalBuddy.git
   cd TerminalBuddy
   ```
2. Build app:
   ```bash
   ./build.sh
   ```
   This script compiles the tool. Once complete, the executable will be placed in the Product/TerminalBuddy folder.

3. Run the app:
   ```bash
    ./Products/TerminalBuddy
   ```
   execute the binary directly or install at your convience follow below method 
 
   ```bash
    chmod +x install.sh
    ./install.sh   
   ```

4. Start chatting with Apple Intelligence directly from your terminal.

---

## Example Usage

```bash
> terminalbuddy
🤖 TerminalBuddy — Apple Intelligence at your command

Usage:
  terminalbuddy "Your question here"

Example:
   terminalbuddy "What’s the weather in London today?"
```

---

## Contributing

We welcome contributions! Feel free to open issues, suggest features, or submit a pull request.

---

## License

This project is licensed under the [MIT License](LICENSE) — see the LICENSE file for details.
