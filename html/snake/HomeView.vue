<template>
  <div @touchstart="onTouchStart"
       @touchmove="onTouchMove"
       @touchend="onTouchEnd">
    <el-container class="home_container">
      <el-header class="home_header">
        <dev :class="{ hovered: drawer }"
             style="cursor: pointer;transition: font-size 0.3s ease;"
             @click="drawer=true">
          求知若渴
          <img src="@/assets/code.png" style="height: 0.8em" alt="NO">
          虚心若愚
        </dev>
      </el-header>
      <el-main class="home_main">
        <el-drawer
            :visible.sync="drawer"
            :modal="false"
            size="100px"
            class="custom-drawer"
            :with-header="false">
          <el-link style="margin-top:10px; width: 100px;height: 100px" href="https://github.com/PerCheung"
                   target="_blank"
                   :underline="false">
            <img src="@/assets/github.png"
                 alt="GitHub"
                 @mouseover="increase_github"
                 @mouseout="reset_github"
                 :style="{ width: isHovered_github ? '100px' : '70px' }"/>
          </el-link>
          <el-link style="width: 100px;height: 100px"
                   @click.native="$router.push('/toc')"
                   :underline="false">
            <img src="@/assets/code.png"
                 alt="toc"
                 @mouseover="increase_toc"
                 @mouseout="reset_toc"
                 :style="{ width: isHovered_toc ? '100px' : '70px' }"/>
          </el-link>
          <el-link style="width: 100px;height: 100px" href="https://blog.csdn.net/weixin_43982359" target="_blank"
                   :underline="false">
            <img src="@/assets/csdn.png"
                 alt="CSDN"
                 @mouseover="increase_csdn"
                 @mouseout="reset_csdn"
                 :style="{ width: isHovered_csdn ? '100px' : '70px' }"/>
          </el-link>
          <el-link style="width: 100px;height: 100px" href="https://percheung.vercel.app" target="_blank"
                   :underline="false">
            <img src="@/assets/openai.png"
                 alt="openai"
                 @mouseover="increase_openai"
                 @mouseout="reset_openai"
                 :style="{ width: isHovered_openai ? '100px' : '70px' }"/>
          </el-link>
          <el-link style="width: 100px;height: 100px"
                   href="https://cowtransfer.com/i/storage"
                   target="_blank"
                   :underline="false">
            <img src="@/assets/nainiu.png"
                 alt="openai"
                 @mouseover="increase_nainiu"
                 @mouseout="reset_nainiu"
                 :style="{ width: isHovered_nainiu ? '100px' : '70px' }"/>
          </el-link>
          <el-link style="width: 100px;height: 100px" href="https://www.openai-hk.com/m/ai" target="_blank"
                   :underline="false">
            <img src="@/assets/openai-hk.png"
                 alt="openai-hk"
                 @mouseover="increase_openai_hk"
                 @mouseout="reset_openai_hk"
                 :style="{ width: isHovered_openai_hk ? '100px' : '70px' }"/>
          </el-link>
          <el-link style="width: 100px;height: 100px" href="https://openkey.cloud/topup" target="_blank"
                   :underline="false">
            <img src="@/assets/openkey.png"
                 alt="openkey"
                 @mouseover="increase_openkey"
                 @mouseout="reset_openkey"
                 :style="{ width: isHovered_openkey ? '100px' : '70px' }"/>
          </el-link>
          <el-link style="width: 100px;height: 100px"
                   href="https://ecs.console.aliyun.com"
                   target="_blank"
                   :underline="false">
            <img src="@/assets/aliyun.png"
                 alt="aliyun"
                 @mouseover="increase_aliyun"
                 @mouseout="reset_aliyun"
                 :style="{ width: isHovered_aliyun ? '100px' : '70px' }"/>
          </el-link>
          <el-link style="width: 100px;height: 100px"
                   href="https://console.cloud.tencent.com/lighthouse/instance/index?rid=4"
                   target="_blank"
                   :underline="false">
            <img src="@/assets/tencent.png"
                 alt="tencent"
                 @mouseover="increase_tencent"
                 @mouseout="reset_tencent"
                 :style="{ width: isHovered_tencent ? '100px' : '70px' }"/>
          </el-link>
          <el-link style="width: 100px;height: 100px"
                   href="https://space.bilibili.com/95256449/video"
                   target="_blank"
                   :underline="false">
            <img src="@/assets/bilibili.png"
                 alt="bilibili"
                 @mouseover="increase_bilibili"
                 @mouseout="reset_bilibili"
                 :style="{ width: isHovered_bilibili ? '100px' : '70px' }"/>
          </el-link>
          <el-link style="width: 100px;height: 100px"
                   href="http://47.113.116.177"
                   target="_blank"
                   :underline="false">
            <img src="@/assets/petercheung.png"
                 alt="petercheung"
                 @mouseover="increase_percheung"
                 @mouseout="reset_percheung"
                 :style="{ width: isHovered_percheung ? '100px' : '70px' }"/>
          </el-link>
        </el-drawer>
      </el-main>
      <el-footer class="home_footer">
        Copyright © 2025 Peter Cheung 保留所有权利
      </el-footer>
    </el-container>
  </div>
</template>

<script>
export default {
  name: 'HomeView',
  data() {
    return {
      drawer: true,
      isHovered_github: false,
      isHovered_csdn: false,
      isHovered_openai: false,
      isHovered_nainiu: false,
      isHovered_openai_hk: false,
      isHovered_tencent: false,
      isHovered_bilibili: false,
      isHovered_percheung: false,
      isHovered_toc: false,
      isHovered_openkey: false,
      isHovered_aliyun: false,
      start: 0,
      move: 0
    };
  },
  created() {
  },
  methods: {
    increase_github() {
      this.isHovered_github = true;
    },
    reset_github() {
      this.isHovered_github = false;
    },
    increase_csdn() {
      this.isHovered_csdn = true;
    },
    reset_csdn() {
      this.isHovered_csdn = false;
    },
    increase_openai() {
      this.isHovered_openai = true;
    },
    reset_openai() {
      this.isHovered_openai = false;
    },
    increase_nainiu() {
      this.isHovered_nainiu = true;
    },
    reset_nainiu() {
      this.isHovered_nainiu = false;
    },
    increase_openai_hk() {
      this.isHovered_openai_hk = true;
    },
    reset_openai_hk() {
      this.isHovered_openai_hk = false;
    },
    increase_openkey() {
      this.isHovered_openkey = true;
    },
    reset_openkey() {
      this.isHovered_openkey = false;
    },
    increase_aliyun() {
      this.isHovered_aliyun = true;
    },
    reset_aliyun() {
      this.isHovered_aliyun = false;
    },
    increase_tencent() {
      this.isHovered_tencent = true;
    },
    reset_tencent() {
      this.isHovered_tencent = false;
    },
    increase_bilibili() {
      this.isHovered_bilibili = true;
    },
    reset_bilibili() {
      this.isHovered_bilibili = false;
    },
    increase_percheung() {
      this.isHovered_percheung = true;
    },
    reset_percheung() {
      this.isHovered_percheung = false;
    },
    increase_toc() {
      this.isHovered_toc = true;
    },
    reset_toc() {
      this.isHovered_toc = false;
    },
    onTouchStart(event) {
      this.start = event.touches[0].clientX;
    },
    onTouchMove(event) {
      this.move = event.touches[0].clientX;
    },
    onTouchEnd() {
      // 计算触摸移动的距离
      const distance = this.move - this.start;
      // 判断触摸移动的距离是否满足您的条件（例如，滑动超过一定距离）
      if (distance < -50) {
        // 左滑触发的事件逻辑
        this.drawer = true;
      }
    }
  }
}
</script>

<style>
@media screen and (min-width: 1024px) {
  .home_container {
    background-image: url("@/assets/hero_lny25_gifting__fypofecxk4qe_large_2x.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    background-color: #f9e5bc;
    color: #c08b4f;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
  }
}

@media screen and (max-width: 1024px) {
  .home_container {
    background-image: url("@/assets/hero_lny25_gifting__fypofecxk4qe_large_2x.png");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    background-color: #f9e5bc;
    color: #c08b4f;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
  }
}

.home_header {
  color: #ad733a;
  padding-top: 0.5em;
  font-size: 2em;
  text-align: center;
}

.home_footer {
  background-color: transparent;
  text-align: center;
  color: #d5b281;
  font-size: 0.8em;
  line-height: 80px;
}

.hovered {
  font-size: 1.5em;
}

.el-drawer__body {
  background-image: linear-gradient(to bottom right, #f4e2b9, #f6dfb7, #e6c69b);
}

</style>