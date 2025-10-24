# Bitcoin-Browser-Bot

![GitHub stars](https://img.shields.io/github/stars/Connor9994/Bitcoin-Browser-Bot?style=social) ![GitHub forks](https://img.shields.io/github/forks/Connor9994/Bitcoin-Browser-Bot?style=social) ![GitHub issues](https://img.shields.io/github/issues/Connor9994/Bitcoin-Browser-Bot) 

Buy/Sell Micro-amounts 24/7

![1](https://github.com/Connor9994/Bitcoin-Browser-Bot/blob/main/Photos/1.png)

![2](https://github.com/Connor9994/Bitcoin-Browser-Bot/blob/main/Photos/2.png)

![3](https://github.com/Connor9994/Bitcoin-Browser-Bot/blob/main/Photos/3.png)

## Overview

This script creates a Windows GUI application that automates Bitcoin trading by analyzing market trends through both traditional data points and innovative screen scraping techniques. The bot monitors price movements, calculates ratios, and executes trades based on custom algorithmic conditions.

## Features

### 🎯 Core Functionality
- **Automated Trading**: Places buy/sell orders on GDAX platform
- **Real-time Monitoring**: Tracks BTC price, balances, and market changes
- **Technical Analysis**: Uses multiple timeframes and derivative calculations
- **Risk Management**: Implements stop-loss and take-profit logic

### 📊 GUI Dashboard
- **Price Tracking**: Current BTC price, 24-hour price, and change since bot start
- **Balance Display**: USD, BTC, and total balance
- **Trading Metrics**: Ratio analysis, average changes, and profit tracking
- **Status Indicators**: Real-time market direction and trading signals

### 🔍 Market Analysis
- **Visual Pattern Recognition**: Analyzes GDAX trading chart colors (red/green ratios)
- **Multi-timeframe Analysis**: 4-minute and 8-minute trend calculations
- **Derivative Analysis**: Rate of change measurements
- **Ratio Tracking**: Whole chart vs. zoomed-in chart comparisons

## How It Works

1. **Setup Phase**: 
   - Launches Internet Explorer with GDAX trading interface
   - Initializes all required DOM elements for interaction
   - Sets up data collection arrays and CSV logging

2. **Analysis Phase**:
   - Continuously captures screenshots of the trading chart
   - Analyzes pixel colors to determine market sentiment (red vs. green)
   - Calculates price derivatives and trend directions
   - Monitors key ratios and average change patterns

3. **Trading Logic**:
   - **Buy Conditions**: When profitability indicators are positive
   - **Sell Conditions**: Sets sell orders at profit targets
   - **Risk Management**: Implements dump orders for stop-loss protection
   - **Order Management**: Tracks order status and execution

## Technical Implementation

### Key Components
- **Windows Forms GUI**: Custom trading dashboard
- **Internet Explorer Automation**: Web interaction and data scraping
- **Screen Capture**: Real-time chart analysis via pixel color detection
- **API Integration**: Uses User32.dll for keypress detection
- **Data Logging**: CSV file output for trade analysis

### Trading Algorithm
```powershell
# Profitability conditions include:
- Positive derivatives
- Positive ratio displays  
- Custom threshold comparisons
- Multi-timeframe confirmation
```

## Requirements

- **Platform**: Windows
- **PowerShell**: Version 5.0 or later
- **Browser**: Internet Explorer
- **Platform Access**: GDAX/Coinbase Pro account
- **Permissions**: Required for screen capture and browser automation

## Usage

1. Run the script in PowerShell
2. The GUI dashboard will open
3. Click "Start" to initialize the trading bot
4. Monitor through the GUI interface
5. Press `F12` to stop the bot

## Important Notes

⚠️ **Disclaimer**: This is a legacy script from when GDAX was operational. It may not work with current Coinbase Pro interfaces and should be used for educational purposes only.

🔒 **Security Note**: The script contains hardcoded element selectors that are specific to the GDAX interface at the time of creation.

📈 **Trading Risk**: Automated trading carries significant financial risk. Always test with small amounts and understand the strategy completely before use.

## Legacy Context

This script represents an interesting approach to trading automation that combines:
- Traditional price analysis
- Computer vision techniques (pixel analysis)
- Web automation
- Real-time GUI monitoring
