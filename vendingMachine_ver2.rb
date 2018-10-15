# 2018.10.14（日）
def main
    # ジュースの管理（ステップ２－初期状態）
    price = [120]
    name = ["コーラ"]
    stock = [5]

    menu = false
    while menu != "3"
        # 投入金額
        coin = true;
        # 投入金額の総計
        balance = 0;
        # 売り上げ金額
        sales = 0

        puts "==========="
        puts "メニュー選択"
        puts "1.購入 2.在庫管理 3.終了"
        menu = gets.chomp()

        case 
        when menu == "1"
            puts "購入"
            puts "コインを入れてください。投入完了をenter！"
            puts "使用可能なお金は10円、50円、100円、500円、1000円札だけだけです。"

            while coin != ""
                coin = gets.chomp()
                # 投入金額
                # お金の投入と払い戻し（ステップ０）
                if coin == "10" or coin == "50" or coin == "100" or 
                    coin == "500" or coin == "1000"
                    balance += coin.to_i
                    puts "投入金額 : " + balance.to_s
                else 
                    if coin == ""
                        puts "投入金額の総計 : " + balance.to_s
                        
                        selection = false
                        while selection != ""
                            
                            check = 0
                            
                            # ジュースの管理（ステップ２－ジュースの情報）
                            # 購入（ステップ３・ステップ４－購入可能なドリンクのリスト）
                            puts "==========="
                            puts "購入可能なジュース"
                            for i in 0..name.length-1
                                juicenumber = i+1
                                if balance >= price[i] and stock[i] != 0
                                    puts juicenumber.to_s  + "." + name[i]
                                    puts price[i].to_s + "円"
                                    puts "在庫:"+stock[i].to_s 
                                    puts "───────────"

                                # 投入金額がジュースの金額より少ない場合
                                else
                                    check += 1
                                end
                            end
                            # ジュース選択可能かどうか確認
                            if check == name.length
                                puts "購入可能なジュースがありません。"
                                selection = ""
                            else
                                # ジュースを選択する
                                puts "ジュース選択"
                                selection = gets.chomp
                            end

                            # 購入（ステップ３－売上金額、釣り銭）
                            if selection == ""
                                puts "釣り銭 : " + balance.to_s
                                puts "売り上げ金額:" + sales.to_s 
                            else
                                puts "==========="
                                number = selection.to_i-1
                                # ジュースがある場合
                                if name[number]
                                    if balance >= price[number] and stock[number] != 0
                                    # 購入成功
                                        puts name[number]+"("+price[number].to_s+")"
                                        stock[number] -= 1
                                        puts "在庫：" + stock[number].to_s
                                    else
                                        # お金が足りない場合
                                        if balance < price[number]
                                            deficit = price[number] - balance
                                            puts deficit.to_s + "円足りないです。"
                                            puts "釣り銭 : " + balance.to_s
                                            break
                                        # 在庫がない場合
                                        else
                                            puts "在庫ありません。"
                                            puts "釣り銭 : " + balance.to_s
                                            break
                                        end
                                    end
                                    # 釣り銭と売り上げ管理（ステップ５）
                                    balance = balance - price[number]
                                    puts "残り金額：" + balance.to_s 
                                    sales += price[number]
                                    puts "売り上げ金額:" + sales.to_s 
                                # ジュースがない場合
                                else
                                    puts "ジュースがありません。"
                                end
                            end
                        end
                    # 扱えないお金（ステップ１）
                    else
                        change = coin
                        puts "釣り銭 : " + change
                    end
                end
            end 

        when menu == "2"
            puts "2.在庫管理"
            management = false
            count = false
            # 在庫管理メニュー
            while management != "5"
                puts "1)在庫確認　2)コーラ追加　3)レッドブル追加　4)水追加　5)back"
                management = gets.chomp() 
                case
                when management == "1"
                    puts "1)在庫確認"
                    puts "───────────"
                    for i in 0..price.length-1
                        puts name[i]
                        puts "価格:" + price[i].to_s
                        puts "在庫:" + stock[i].to_s
                        puts "───────────"
                    end

            # 機能拡張（ステップ４－ドリンク追加）
                when management == "2"
                    puts "2)コーラ追加"
                    price[management.to_i-2] = 120
                    name[management.to_i-2] = "コーラ"
                    stock[management.to_i-2] = 5

                when management == "3"
                    puts "3)レッドブル追加"

                    for i in 0..name.length-1
                        if name[i] == "レッドブル"
                            count = i.to_s
                            break
                        end 
                    end

                    if count == false
                        price[price.length] = 200
                        name[name.length] = "レッドブル"
                        stock[stock.length] = 5
                    else 
                        price[count.to_i] = 200
                        name[count.to_i] = "レッドブル"
                        stock[count.to_i] = 5
                        count = false
                    end

                when management == "4"
                    puts "4)水追加"
                    for i in 0..name.length-1
                        if name[i] == "水"
                            count = i.to_s
                            break
                        end 
                    end

                    if count == false
                        price[price.length] = 100
                        name[name.length] = "水"
                        stock[stock.length] = 5
                    else 
                        price[count.to_i] = 100
                        name[count.to_i] = "水"
                        stock[count.to_i] = 5
                        count = false
                    end
                end
            end
        end
    end
end


puts main