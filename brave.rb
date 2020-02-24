require './character'
class Brave < Character

  # attr_readerの記述でゲッターを省略することができる
  # attr_reader :name, :offense, :defense
  # attr_accessor :hp

  # paramsで一括で受け取る
  # 引数に**を記述：ハッシュしか受け取れなくなる。
  # 受け取るハッシュはnew演算子で定めた値
  # .new(name: "テリー", hp: 500, offense: 150, defense: 100
  SPECIAL_ATTACK_CONSTANT = 1.5

  # def initialize(**params)
  #   @name = params[:name]
  #   @hp = params[:hp]
  #   @offense = params[:offense]
  #   @defense = params[:defense]
  # end

  # 引数でモンスタークラスのインスタンスを受け取る
  def attack(monster)
    attack_type = decision_attack_type
    damage = calculate_damage(target: monster, attack_type: attack_type)
    cause_damage(target: monster, damage: damage)

    attack_message(attack_type: attack_type)
    damage_message(target: monster, damage: damage)
  end

  private

    def decision_attack_type
      attack_num = rand(4)

      if attack_num == 0
        # puts "必殺攻撃"
        "special_attack"
      else
        # puts "普通の攻撃"
        "nomal_attack"
      end
    end

    def calculate_damage(**params)
      target = params[:target]
      attack_type = params[:attack_type]

      if attack_type == "special_attack"
        calculate_special_attack - target.defense
      else
        @offense - target.defense
      end
    end

    def cause_damage(**params)
      damage = params[:damage]
      target = params[:target]

      target.hp -= damage
      target.hp = 0 if target.hp < 0
      # puts "#{target.name}は#{damage}のダメージを受けた"
    end

    def calculate_special_attack
      @offense * SPECIAL_ATTACK_CONSTANT
    end

end
