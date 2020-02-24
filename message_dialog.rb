module MessageDialog
  # 攻撃時のメッセージ
  def attack_message(**params)
    attack_type = params[:params]

    puts "#{@name}の攻撃"
    puts "必殺技!!!" if attack_type == "special_attack"
  end

  # ダメージを受けた時のメッセージ
  def damage_message(**params)
    target = params[:target]
    damage = params[:damage]

    puts <<~EOS
    #{target.name}は#{damage}のダメージを受けた
    #{target.name}の残りHPは#{target.hp}だ
    EOS

  end

  # バトルが終了した時のメッセージ
  def end_message(result)
    if result[:brave_win_flag]
      puts <<~EOS

      勇者は勝った
      #{result[:exp]}の経験値と#{result[:gold]}のゴールドを手に入れた

      EOS

    else
      puts <<~EOS

      勇者はまけた
      目の前が真っ暗になった

      EOS
    end
  end

  def transform_message(**params)
    origin_name = params[:origin_name]
    transform_name = params[:transform_name]

    # puts <<~TEXT
    #{@name}は怒っている
    #{@name}は#{transform_name}に変身した
    # TEXT
  end
end
