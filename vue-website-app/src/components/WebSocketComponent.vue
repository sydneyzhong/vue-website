<template>
  <div>
    <!-- 组件模板 -->
  </div>
</template>

<script>
export default {
  data() {
    return {
      socket: null,
    };
  },
  mounted() {
    this.initWebSocket();
  },
  beforeDestroy() {
    this.closeWebSocket();
  },
  methods: {
    initWebSocket() {
      // 创建 WebSocket 连接
      this.socket = new WebSocket('ws://localhost:8081/ws');

      // 监听打开事件
      this.socket.onopen = () => {
        console.log('WebSocket is open');
      };

      // 监听消息事件
      this.socket.onmessage = (event) => {
        console.log('Received message:', event.data);
        // 处理接收到的消息
      };

      // 监听错误事件
      this.socket.onerror = (error) => {
        console.error('WebSocket error:', error);
      };

      // 监听关闭事件
      this.socket.onclose = () => {
        console.log('WebSocket connection closed');
      };
    },
    closeWebSocket() {
      if (this.socket && this.socket.readyState === WebSocket.OPEN) {
        this.socket.close();
      }
    }
  }
};
</script>

