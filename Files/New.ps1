function Test-KeyPress
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.Windows.Forms.Keys[]]
        $Keys
    )
    
    # use the User32 API to define a keypress datatype
    $Signature = @'
    [DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)] 
    public static extern short GetAsyncKeyState(int virtualKeyCode); 
'@
    $API = Add-Type -MemberDefinition $Signature -Name 'Keypress' -Namespace Keytest -PassThru
    
    # test if each key in the collection is pressed
    $Result = foreach ($Key in $Keys)
    {
        [bool]($API::GetAsyncKeyState($Key) -eq -32767)
    }
    
    # if all are pressed, return true, if any are not pressed, return false
    $Result -notcontains $false
}

#region GUI 
Add-Type -AssemblyName System.Windows.Forms
$Icon = New-Object system.drawing.icon (".\Files\Logo.ico")
$Font = New-Object System.Drawing.Font("Times New Roman",9)

$MainGUI = New-Object system.Windows.Forms.Form
$MainGUI.Text = "Main Page"
$MainGUI.TopMost = $false
$MainGUI.Width = 500
$MainGUI.Height = 500
$MainGUI.Icon = $Icon
$MainGUI.Font = $Font
$MainGUI.FormBorderStyle = 'FixedDialog'

##----------------------------MAIN PAGE GUI----------------------------##
$Button_Task1 = New-Object system.windows.Forms.Button
$Button_Task1.Text = "Start"
$Button_Task1.location = new-object system.drawing.point(10,13)
$Button_Task1.size = New-Object System.Drawing.Size(126,35) 
$Button_Task1.Font = "Arial,10,style=Bold"
$MainGUI.controls.Add($Button_Task1)
$MainGUI.AcceptButton = $Button_Task1

$StatusTextBox = New-Object System.Windows.Forms.TextBox 
$StatusTextBox.Location = New-Object System.Drawing.Size(145,20) 
$StatusTextBox.Size = New-Object System.Drawing.Size(100,20) 
$MainGUI.Controls.Add($StatusTextBox)

$TimeOfRatios = New-Object System.Windows.Forms.TextBox 
$TimeOfRatios.Location = New-Object System.Drawing.Size(250,20) 
$TimeOfRatios.Size = New-Object System.Drawing.Size(100,20) 
$TimeOfRatios.Multiline = $true
$MainGUI.Controls.Add($TimeOfRatios)

$AverageChangeTextBox = New-Object System.Windows.Forms.TextBox 
$AverageChangeTextBox.Location = New-Object System.Drawing.Size(10,53) 
$AverageChangeTextBox.Size = New-Object System.Drawing.Size(400,20) 
$MainGUI.Controls.Add($AverageChangeTextBox)

$BTCPriceTextBox = New-Object System.Windows.Forms.TextBox 
$BTCPriceTextBox.Location = New-Object System.Drawing.Size(25,110) 
$BTCPriceTextBox.Size = New-Object System.Drawing.Size(100,20) 
$MainGUI.Controls.Add($BTCPriceTextBox)

$BTCPriceLabel = New-Object system.windows.Forms.Label
$BTCPriceLabel.Text = "Current Price"
$BTCPriceLabel.AutoSize = $true
$BTCPriceLabel.location = new-object system.drawing.point(25,95)
$BTCPriceLabel.Size = New-Object System.Drawing.Size(100,20) 
$BTCPriceLabel.Font = "Microsoft Sans Serif,10"
$MainGUI.controls.Add($BTCPriceLabel)

$24HourPriceTextBox = New-Object System.Windows.Forms.TextBox 
$24HourPriceTextBox.Location = New-Object System.Drawing.Size(130,110) 
$24HourPriceTextBox.Size = New-Object System.Drawing.Size(100,20) 
$MainGUI.Controls.Add($24HourPriceTextBox)

$24HourPriceLabel = New-Object system.windows.Forms.Label
$24HourPriceLabel.Text = "24 Hour Price"
$24HourPriceLabel.AutoSize = $true
$24HourPriceLabel.location = new-object system.drawing.point(130,95)
$24HourPriceLabel.Size = New-Object System.Drawing.Size(100,20) 
$24HourPriceLabel.Font = "Microsoft Sans Serif,10"
$MainGUI.controls.Add($24HourPriceLabel)

$ChangeSinceStartTextBox = New-Object System.Windows.Forms.TextBox 
$ChangeSinceStartTextBox.Location = New-Object System.Drawing.Size(235,110) 
$ChangeSinceStartTextBox.Size = New-Object System.Drawing.Size(100,20) 
$MainGUI.Controls.Add($ChangeSinceStartTextBox)

$ChangeSinceStartLabel = New-Object system.windows.Forms.Label
$ChangeSinceStartLabel.Text = "Change Since Start"
$ChangeSinceStartLabel.AutoSize = $true
$ChangeSinceStartLabel.location = new-object system.drawing.point(235,95)
$ChangeSinceStartLabel.Size = New-Object System.Drawing.Size(100,20) 
$ChangeSinceStartLabel.Font = "Microsoft Sans Serif,10"
$MainGUI.controls.Add($ChangeSinceStartLabel)

$BalanceUSDTextBox = New-Object System.Windows.Forms.TextBox 
$BalanceUSDTextBox.Location = New-Object System.Drawing.Size(25,150) 
$BalanceUSDTextBox.Size = New-Object System.Drawing.Size(100,20) 
$MainGUI.Controls.Add($BalanceUSDTextBox)

$BalanceUSDLabel = New-Object system.windows.Forms.Label
$BalanceUSDLabel.Text = "USD"
$BalanceUSDLabel.AutoSize = $true
$BalanceUSDLabel.location = new-object system.drawing.point(25,135)
$BalanceUSDLabel.Size = New-Object System.Drawing.Size(100,20) 
$BalanceUSDLabel.Font = "Microsoft Sans Serif,10"
$MainGUI.controls.Add($BalanceUSDLabel)

$BalanceBTCTextBox = New-Object System.Windows.Forms.TextBox 
$BalanceBTCTextBox.Location = New-Object System.Drawing.Size(25,190) 
$BalanceBTCTextBox.Size = New-Object System.Drawing.Size(100,20) 
$MainGUI.Controls.Add($BalanceBTCTextBox)

$BalanceBTCLabel = New-Object system.windows.Forms.Label
$BalanceBTCLabel.Text = "BTC"
$BalanceBTCLabel.AutoSize = $true
$BalanceBTCLabel.location = new-object system.drawing.point(25,175)
$BalanceBTCLabel.Size = New-Object System.Drawing.Size(100,20) 
$BalanceBTCLabel.Font = "Microsoft Sans Serif,10"
$MainGUI.controls.Add($BalanceBTCLabel)

$XCycleChangeTextbox = New-Object System.Windows.Forms.TextBox 
$XCycleChangeTextbox.Location = New-Object System.Drawing.Size(150,150) 
$XCycleChangeTextbox.Size = New-Object System.Drawing.Size(300,300) 
$MainGUI.Controls.Add($XCycleChangeTextbox)
$XCycleChangeTextbox.Multiline = $true

$TotalBalanceTextBox = New-Object System.Windows.Forms.TextBox 
$TotalBalanceTextBox.Location = New-Object System.Drawing.Size(25,230) 
$TotalBalanceTextBox.Size = New-Object System.Drawing.Size(100,20) 
$MainGUI.Controls.Add($TotalBalanceTextBox)

$RatioTextBox = New-Object System.Windows.Forms.TextBox 
$RatioTextBox.Location = New-Object System.Drawing.Size(25,280) 
$RatioTextBox.Size = New-Object System.Drawing.Size(100,100) 
$RatioTextBox.Multiline = $true
$MainGUI.Controls.Add($RatioTextBox)

$TotalBalanceLabel= New-Object system.windows.Forms.Label
$TotalBalanceLabel.Text = "Total Balance"
$TotalBalanceLabel.AutoSize = $true
$TotalBalanceLabel.location = new-object system.drawing.point(25,215)
$TotalBalanceLabel.Size = New-Object System.Drawing.Size(100,20) 
$TotalBalanceLabel.Font = "Microsoft Sans Serif,10"
$MainGUI.controls.Add($TotalBalanceLabel)

$PictureBox2 = New-Object system.windows.Forms.PictureBox
$PictureBox2.location = new-object system.drawing.point(5,79)
$MainGUI.controls.Add($PictureBox2)
$file = (get-item '.\Files\Border.png')
$img = [System.Drawing.Image]::Fromfile($file);
$PictureBox2.Image = $img;
$PictureBox2.Width =  $img.Size.Width;
$PictureBox2.Height =  $img.Size.Height;
$Date=$(get-date -f yyyy-MM-dd)
#endregion

    #Start
    $Button_Task1.Add_Click({
	#region Setup
	$ie = New-Object -ComObject 'InternetExplorer.Application'
	$ie.AddressBar = $false
	$ie.MenuBar = $false
	$ie.StatusBar = $false
	$ie.ToolBar = $false
	$IE.Top=0
	$IE.Left=-7
	$IE.Width=1000
	$IE.Height=800
	$ie.Visible = $true
	$ie.navigate("https://www.gdax.com/trade/BTC-USD")
	
		While ($ie.Busy)
{
    Sleep -Milliseconds 100
}
	Sleep -Milliseconds 3000
	$Document=$ie.document
	Sleep -Milliseconds 1000
	
	#Find Value for BTC Currency
	$global:BTC=$Document.IHTMLDocument3_getElementsByTagName("span") | Where { $_.className -eq 'MarketInfo_market-num_1n4xE'}
	
	#Find Value for Current Balance
	$global:Balance=$Document.IHTMLDocument3_getElementsByTagName("span") | Where { $_.className -eq 'BalanceInfo_term-description_sYKVn'}
	
	#Find and click "Limit" Button
	$global:LimitButton=$Document.IHTMLDocument3_getElementsByTagName("li") | Where { $_.className -eq 'OrderForm_trade-type-tab_mgQKP'}
	$LimitButton[0].click(1)
	
	#Find amount Box
	$global:AmountBox=$Document.IHTMLDocument3_getElementsByTagName("input") | Where { $_.Name -eq 'amount'}
	
	#Find LimitPrice Box
	$global:LimitPriceBox=$Document.IHTMLDocument3_getElementsByTagName("input") | Where { $_.type -eq 'number'}
	
	#Find Place Buy Order Button
	$global:innerSell=$Document.IHTMLDocument3_getElementsByTagName("button") | Where { $_.className -eq 'sc-jzJRlG fHgzn'}
	
	#Find innerBuy button
	$global:innerBuySelected=$Document.IHTMLDocument3_getElementsByTagName("li") | Where { $_.className -eq 'OrderForm_toggle-tab_34XsM OrderForm_buy_2_11M OrderForm_active_gU7zf'}
	
	#Not Selected
	$global:innerBuy=$Document.IHTMLDocument3_getElementsByTagName("li") | Where { $_.className -eq 'OrderForm_toggle-tab_34XsM OrderForm_buy_2_11M'}
	
	#Find innerSell button
	$global:innerSellSelected=$Document.IHTMLDocument3_getElementsByTagName("li") | Where { $_.className -eq 'OrderForm_toggle-tab_34XsM OrderForm_sell_13fkY OrderForm_active_gU7zf'}
	
	#Not Selected
	$global:innerSell=$Document.IHTMLDocument3_getElementsByTagName("li") | Where { $_.className -eq 'OrderForm_toggle-tab_34XsM OrderForm_sell_13fkY'}
	
	#Find Current Buy/Sell Order
	$global:CurrentBuyorSell=$Document.IHTMLDocument3_getElementsByTagName("span") | Where { $_.className -eq 'OrderList_cancel-text_t6mKu'}
	#Check to see if same when is a sale value
	
	#Find and click Zoom Button on Graph
	$ZoomIn=$Document.IHTMLDocument3_getElementsByTagName("button") | Where { $_.classname -eq 'ZoomControls_zoom-in_3YuCi'}
	$ZoomIn.click(1)
	$ZoomIn.click(1)
	
	$NewLine = "{0},{1},{2},{3},{4},{5},{6},{7}" -f "Direction","Outer Ratio","Inner Ratio","Change in $","% Change over last 4 minutes","% Change over last 8 minutes","Double Derivative","Total Profit $"
	if ([System.IO.File]::Exists((Resolve-Path .\).Path+"\"+$Date+"_0"+".csv") -eq 1)
	{
	for ($n=0;$n -le 100;$n++)
	{
	if ([System.IO.File]::Exists((Resolve-Path .\).Path+"\"+$Date+"_"+$n+".csv") -eq 0)
	{
	$NewLine | add-content -path ".\$Date`_$n.csv"
	$FileNumber=$n
	break
	}
	}
	}
	else
	{
	$FileNumber=0
	$NewLine | add-content -path ".\$Date`_$FileNumber.csv"
	}
	
	
	#Original Value of BTC
	$OriginalCost=$BTC[0].innertext
	$OriginalCost=$OriginalCost -replace 'USD',''
	$OriginalCost=[Double]$OriginalCost
	
	#Entry Variables
	#Last X Change Cycles Will Be Recorded
	$X=200
	$XRatio=1000
	$CurrentCostArray = [System.Collections.ArrayList]@()
	$XCycleChange = [System.Collections.ArrayList]@()
	$AverageTime = [System.Collections.ArrayList]@()
	$AverageRatioTime = [System.Collections.ArrayList]@()
	$Profit = [System.Collections.ArrayList]@()
	$Ratio1 = [System.Collections.ArrayList]@()
	$Ratio2 = [System.Collections.ArrayList]@()
	$PreviousValueOfBTC=$null
	$BuyOrderSet=0
	$SellOrderSet=0
	$LoseMoneySet=0
	$Profitable=0
	Sleep -milliseconds 1000
	
$StopWatch = [Diagnostics.Stopwatch]::StartNew()
$StopWatchRatio = [Diagnostics.Stopwatch]::StartNew()
#endregion

#Continuously Acquire Data Until Key Is Pressed
while($true)
{
	#Take and open screenshot
	#Desktop Specs
	$Width1=555
	$Height1=193
	[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
	$bitmap1 = New-Object System.Drawing.Bitmap $Width1, $Height1
	$graphic = [System.Drawing.Graphics]::FromImage($bitmap1)
	$graphic.CopyFromScreen(430, 310, 0, 0, $bitmap1.Size)
	#$bitmap1.save(".\Large.jpg") 
	
	#Desktop Zoomed into center graph
	$Width2=50
	$Height2=193
	[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
	$bitmap2 = New-Object System.Drawing.Bitmap $Width2, $Height2
	$graphic = [System.Drawing.Graphics]::FromImage($bitmap2)
	$graphic.CopyFromScreen(682, 310, 0, 0, $bitmap2.Size)
	#$bitmap2.save(".\Small.jpg")
	
	#Determine if more red than green
	$G1=0;
	$R1=0;
	for ($x=0; $x -le $Width1-1; $x++) 
	{
	for ($y=0; $y -le $Height1-1; $y++)
	{
	$Color=$bitmap1.getpixel($x,$y).name
	If ($Color -eq 'ff2e4a3b')
	{
	#If Color is Green
	$G1=$G1+1; 
	}
	If ($Color -eq 'ff4b3735')
	{
	#If Color is Red
	$R1=$R1+1;
	}
	}
	}
	
	#Determine if more red than green
	$G2=0;
	$R2=0;
	for ($x=0; $x -le $Width2-1; $x++) 
	{
	for ($y=0; $y -le $Height2-1; $y++)
	{
	$Color=$bitmap2.getpixel($x,$y).name
	If ($Color -eq 'ff2e4a3b')
	{
	#If Color is Green
	$G2=$G2+1;
	}
	If ($Color -eq 'ff4b3735')
	{
	#If Color is Red
	$R2=$R2+1;
	}
	}
	}
	if($R -gt $G)
	{
	$GrowingText="Down"
	}
	elseif ($G -gt $R)
	{
	$GrowingText="Up"
	}
	
	if($PreviousValueOfRatio1 -ne $Null)
	{
	if($PreviousValueOfRatio1 -ne $Ratio1)
	{
	if ($Ratio1.Length -ge $XRatio)
	{
	$Ratio1 = $Ratio1[1..($Ratio1.Length-1)]
	$Ratio2 = $Ratio2[1..($Ratio2.Length-1)]
	$AverageRatioTime = $AverageRatioTime[1..($AverageRatioTime.Length-1)]
	}
	$AverageRatioTime += ($StopWatchRatio.Elapsed.milliseconds)/1000
	$RatioAverage=$AverageRatioTime | Measure-Object -Average
	$TimeOfRatios.text=[string]$RatioAverage.average+"seconds"
	$Ratio1 +=($G1/$R1)-1
	$Ratio2 +=($G2/$R2)-1
	$StopWatchRatio = [Diagnostics.Stopwatch]::StartNew()
	}
	}
	else
	{
	$Ratio1 +=($G1/$R1)-1
	$Ratio2 +=($G2/$R2)-1
	$StopWatchRatio = [Diagnostics.Stopwatch]::StartNew()
	}
	
	#Last x minutes of time data
	if ($Ratio1.Length -ge $XRatio)
	{
	if($RatioAverage.average -ge .1)
	{
	$NumberOfMinutes=2
	$RatioNewXLength=[math]::Round($NumberOfMinutes*60* [math]::pow($RatioAverage.average, -1))
	$Ratio1RegionToAnalyze = $Ratio1[($Ratio1.Length-$RatioNewXLength)..($Ratio1.Length-1)]
	$Ratio2RegionToAnalyze = $Ratio2[($Ratio2.Length-$RatioNewXLength)..($Ratio2.Length-1)]
	}
	else
	{
	$Ratio1RegionToAnalyze = $Ratio1
	$Ratio2RegionToAnalyze = $Ratio2
	}
	$Ratio1Avg=$Ratio1RegionToAnalyze | Measure-Object -Average
	$Ratio1Display=$Ratio1Avg.average
	$Ratio2Avg=$Ratio2RegionToAnalyze | Measure-Object -Average
	$Ratio2Display=$Ratio2Avg.average
	}
	$PreviousValueOfRatio1 = $Ratio1[$Ratio1.length-1]
	
	$Profitable=0
	#if ($AverageChange.average*100 -gt .01) {$Profitable=1} 	#($Ratio1Display -gt 0) -AND ($Ratio2Display -gt 0) 
	if (($Derivative -gt .002) -AND ($Ratio1Display -gt 0) -AND ($Ratio1Display -ne $Null)){$Profitable=1} 	#($Ratio1Display -gt 0) -AND ($Ratio2Display -gt 0) 
	
	#Keep Track of BTC Cost
	$CurrentCost=$BTC[0].innertext
	$BTCPriceTextBox.text=$CurrentCost
	$CurrentCost=$CurrentCost -replace 'USD',''
	$CurrentCost=[Double]$CurrentCost
	$CurrentCostArray += $CurrentCost  #What unit do we want to use to make a tread-line?
	
	#Keep Track of 24 Hour Change
	$24HourPrice=$BTC[2].innertext
	$24HourPriceTextBox.text=$24HourPrice	
	
	#Calculate X Cycle Change
	if($PreviousValueOfBTC -ne $Null)
	{
	if($PreviousValueOfBTC -ne $CurrentCost)
	{
	if ($XCycleChange.Length -ge $X)
	{
	$XCycleChange = $XCycleChange[1..($XCycleChange.Length-1)]
	$AverageTime = $AverageTime[1..($AverageTime.Length-1)]
	}
	$XCycleChange += (($CurrentCost/$PreviousValueOfBTC) - 1)
	#$XCycleChangeTextbox.text=$XCycleChange
		$XCycleChangeAvg=$XCycleChange | Measure-Object -Average
		$AverageTime += $StopWatch.Elapsed.Seconds
		$TimeAverage=$AverageTime | Measure-Object -Average
		$StatusTextBox.text=[string]$TimeAverage.average+"seconds"
		$StopWatch = [Diagnostics.Stopwatch]::StartNew()
		#$XCycleChangeTextbox.text=$AverageTime
	}
	}
	
	#Last 4 minutes of time data
	if ($XCycleChange.Length -ge $X)
	{
	if($TimeAverage.average -ge 2.5)
	{
	$NumberOfMinutes=4
	$NewXLength=[math]::Round($NumberOfMinutes*60* [math]::pow($TimeAverage.average, -1))
	$RegionToAnalyze = $XCycleChange[($XCycleChange.Length-$NewXLength)..($XCycleChange.Length-1)]
	}
	else
	{
	$RegionToAnalyze = $XCycleChange
	}
	$AverageChange=$RegionToAnalyze | Measure-Object -Average
	$AverageChangeTextBoxText=$AverageChange.average
	}
	
	#Last 1 minute(s) of time data
	if ($XCycleChange.Length -ge $X)
	{
	if($TimeAverage.average -ge 2.5)
	{
	$NumberOfMinutes=1
	$NewXLength=[math]::Round($NumberOfMinutes*60* [math]::pow($TimeAverage.average, -1))
	$RegionToAnalyzeOuter = $XCycleChange[($XCycleChange.Length-$NewXLength)..($XCycleChange.Length-1)]
	}
	else
	{
	$RegionToAnalyzeOuter = $XCycleChange
	}
	$AverageChangeOuter=$RegionToAnalyzeOuter | Measure-Object -Average
	}
	
	<# #Calculate derivatives
	$i=1
	$Derivative = [System.Collections.ArrayList]@()
	for ($i=0;$i -lt $XCycleChange.Length-1;$i++)
	{
	$Derivative += $XCycleChange[($i+1)] - $XCycleChange[($i)]
	} #>
	
	#Up or Down based on ratios at the time
	if($PreviousValueOfBTC -gt $CurrentCost)
	{
	$Derivative=$XCycleChange[($XCycleChange.length-1)] - $XCycleChange[($XCycleChange.length-2)]
	$XCycleChangeTextbox.text="Down "+"`r`n"+"Whole "+[string]$Ratio1Display+"`r`n"+"Inner "+[string]$Ratio2Display+"`r`n"+"Average Change "+[string]$AverageChange.average
	$NewLine = "{0},{1},{2},{3},{4},{5},{6},{7}" -f "Down",$Ratio1Display,$Ratio2Display,($CurrentCost-$PreviousValueOfBTC),($AverageChange.average*100),($AverageChangeOuter.average*100),$Derivative,$SumProfit.Sum
	$NewLine | add-content -path ".\$Date`_$FileNumber.csv"
	}
	if($PreviousValueOfBTC -lt $CurrentCost)
	{
	$Derivative=$XCycleChange[($XCycleChange.length-1)] - $XCycleChange[($XCycleChange.length-2)]
	$XCycleChangeTextbox.text="Up "+"`r`n"+"Whole "+[string]$Ratio1Display+"`r`n"+"Inner "+[string]$Ratio2Display+"`r`n"+"Average Change "+[string]$AverageChange.average
	$NewLine = "{0},{1},{2},{3},{4},{5},{6},{7}" -f "Up",$Ratio1Display,$Ratio2Display,($CurrentCost-$PreviousValueOfBTC),($AverageChange.average*100),($AverageChangeOuter.average*100),$Derivative,$SumProfit.Sum
	$NewLine | add-content -path ".\$Date`_$FileNumber.csv"
	}
	
#region BUY & SELL
	
	if (($SellOrderSet -eq 0) -AND ($BuyOrderSet -eq 0))
	{
	if ($Profitable -eq 1)
	{
	#Set a buy order as $1 more than current price
	$BuyOrderSet=1
	$BuyOrderPrice=($CurrentCost + 1)
	$RatioTextBox.text="Buy `r`n"+[string]$BuyOrderPrice
	}
	}
	
	if ($BuyOrderSet -eq 1)
	{
	if ($CurrentCost -le ($BuyOrderPrice - 10))
	{
	$BuyOrderSet=0
	$RatioTextBox.text=""
	}
	}
	
	#Check if order is still set. If it isn't there, confirm purchase at the price set
	if ($BuyOrderSet -eq 1)
	{
	if ($CurrentCost -ge $BuyOrderPrice)
	{
	#Create a sell order at 1% higher than current price
	$SellOrderSet=1
	$SellOrderPrice=($CurrentCost + 5)
	$BuyOrderSet=0
	$RatioTextBox.text="Sell `r`n"+[string]$SellOrderPrice
	}
	}
	
	#Dump
	if ($SellOrderSet -eq 1)
	{
	if ($CurrentCost -le $SellOrderPrice*.99)
	{
	#Cancel Sale and Resell at 1% Lower than current price
	$SellOrderPrice=($CurrentCost - 1)
	$LoseMoneySet=1
	$RatioTextBox.text="Dump Sell `r`n"+[string]$SellOrderPrice
	}
	}
	
	#Check if order is still set. If it isn't there, confirm sale at the price set	
	if ($SellOrderSet -eq 1)
	{
	#if (Order has been fulfilled)
	if ($LoseMoneySet -eq 1)
	{
	if ($CurrentCost -le $SellOrderPrice)
	{
	$LoseMoneySet=0
	$SellOrderSet=0
	$Profit += ($SellOrderPrice-$BuyOrderPrice)*.001
	$SumProfit=$Profit | Measure-Object -Sum
	$AverageChangeTextBox.text="$"+[string]$SumProfit.Sum
	$RatioTextBox.text="Dumped"
	}
	}
	if ($CurrentCost -ge $SellOrderPrice)
	{
	$SellOrderSet=0
	$Profit += ($SellOrderPrice-$BuyOrderPrice)*.001
	$SumProfit=$Profit | Measure-Object -Sum
	$AverageChangeTextBox.text="$"+[string]$SumProfit.Sum
	$RatioTextBox.text="Sold"
	}
	}
	$SumProfit=$Profit | Measure-Object -Sum
	$AverageChangeTextBox.text="$"+[string]$SumProfit.Sum
	#endregion
	
	#Current Balance
	$BalanceUSD=$Balance[0].innertext
	$BalanceUSDTextBox.text=$BalanceUSD
	$BalanceBTC=$Balance[1].innertext
	$BalanceBTCTextBox.text=$BalanceBTC
	$TotalBalance=($CurrentCost*$BalanceBTC)+$BalanceUSD
	$TotalBalanceTextBox.text=$TotalBalance
	
	# Change Since Bot Start
	$ChangeSinceStart=(($CurrentCost-$OriginalCost)/$OriginalCost)*100
	$ChangeSinceStart=[math]::Round($ChangeSinceStart,5)
	$ChangeSinceStartTextBox.text=[string]$ChangeSinceStart+"%"
	
	#Sleep -Milliseconds 100 
	if (Test-KeyPress -Keys F12)
	{
	break
	}
	
	#Exit Variables
	$PreviousValueOfBTC=$CurrentCost
}
	$ie.quit()
	})
	
[void]$MainGUI.ShowDialog()
$MainGUI.Dispose()
	
	
	
	