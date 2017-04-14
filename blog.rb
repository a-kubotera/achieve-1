blogs = []

while true
    ["以下より行う操作を選んでください","1:ブログを作成する","2:作成されたブログを見る", "3:ブログアプリを終了する"].each do |function|
    puts function
    end
    number = gets.to_i

    if number == 1
        blog = {}
        puts '1:ブログを作成する'
        puts 'ブログのタイトルを入力して下さい'
        blog[:title] = gets
        puts 'ブログの本文を入力して下さい'
        blog[:content] = gets
        blogs << blog
        puts "------入力確認 ------"
        puts "タイトル : #{blog[:title]}"
        puts "本文 : #{blog[:content]}"
        puts blogs
    elsif number == 2
        puts '2:作成されたブログを見る'
        blogs.each do |blog|
        puts "タイトル:#{blog[:title]}"
        puts "本文:#{blog[:content]}"
        puts "----------"
    end
    elsif number == 3
        puts '3:ブログアプリを終了する'
        break

    else
        puts '1から3の数字を入力して下さい'
    end
end