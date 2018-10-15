# 2018.10.13（土）
def kind(number, work, balance)
    price = [120, 200, 100]
    name = ["1. コーラ", "2. レッドブル", "3. 水"]
    stock = [5, 5, 5]
    
    case 
    when work == 1
        puts "───────────"
        for i in 0..2
            puts name[i]
            puts price[i].to_s + "円"
            puts stock[i]
            puts "───────────"
        end
    when work == 2
        puts "───────────"
        for i in 0..2
            if balance.to_i >= price[i] and stock[i] != 0
                puts name[i]
                puts price[i].to_s + "円"
                puts stock[i]
                puts "───────────"
                
            end
        end

    when work == 3
        # 재고 줄이고 가격 반환
        puts name[number] + "(" + price[number].to_s + ")" 
        if balance.to_i >= price[number].to_i and stock[number] != 0
            stock[number] -= 1
            puts "価格 : " + price[number].to_s + "円"
            balance -= price[number]
            # puts "残り" + balance.to_s + "円"
        else
            if balance.to_i < price[number].to_i
                deficit = price[number].to_i - balance.to_i
                puts deficit.to_s + "円不足している"
            else
                puts "在庫ありません。"
            end
        end 
        return balance
    end

end

def main
    # 잔액 
    balance = 0
    # 투입금액
    coin = 0
    # 매출액 
    sales = 0

    # 제품 종류
    puts kind 0, 1, balance

    puts "コインを入れてください。投入完了をendを入力！"
    puts "使用可能なお金は10円、50円、100円、500円、1000円札だけだけです。"
    while coin != "end"
        coin = gets.chomp()
        # 입력 금액
        if coin == "10" or coin == "50" or coin == "100" or 
            coin == "500" or coin == "1000" or coin == "end"
            balance += coin.to_i
            puts "残り" + balance.to_s + "円"  
            # 금액 투입 완료
            if coin == "end"
                # 가격
                
                # ステップ4
                puts "購入可能な飲み物"
                puts kind 0, 2, balance
              
                puts "飲み物選択"
                puts "釣り銭はexit入力"
                selection = 0
                while selection != "exit"
                    selection = gets.chomp 
                    case 
                        when selection == "1"
                            balance = kind 0, 3, balance
                        when selection == "2"
                            balance =  kind 1, 3, balance
                        when selection == "3"
                            balance =  kind 2, 3, balance
                        when selection == "exit"
                            puts "釣り銭 : " + balance.to_s + "円"
                            balance = 0
                    end
                    puts "残り" + balance.to_s + "円"
                end
                # ステップ2 ステップ３
                # coke_price = 120 
                # coke_name = "コーラ"
                # coke_stock = 5
                # # 구입
                # if balance.to_i >= coke_price.to_i and coke_stock != 0
                #     puts coke_name + "(" + coke_price.to_s + "円)"
                #     puts "구입하시겠습니까? yes/no"
                #     # 구입 여부
                #     buy = "yes"
                #     while buy == "yes"
                #         buy = gets.chomp
                #         if buy == "yes"
                #             sales += coke_price
                #             balance -= coke_price
                #             coke_stock -= 1
                #             puts "재고 : " + coke_stock.to_s
                #         end
                #         puts "매출액 : " + sales.to_s + "円"
                #     end

                # end
                # change = balance
                # balance = 0
            end
            # puts "残り" + balance.to_s + "円"  
        # 입력 금액 예외
        else 
            change = coin.to_s
            puts "釣り銭 : " + change 
        end
    end 
    # puts "釣り銭 : " + change.to_s 
end
# def Stock 

puts main

