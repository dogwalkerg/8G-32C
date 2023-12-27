<span class="prism-token prism-comment" spellcheck="true"># 使用 Ubuntu 22.04 作为基础镜像</span>
FROM ubuntu:22.04

<span class="prism-token prism-comment" spellcheck="true"># 安装 Shellinabox</span>
RUN <span class="prism-token prism-function">apt-get</span> update <span class="prism-token prism-operator">&&</span> \
    <span class="prism-token prism-function">apt-get</span> <span class="prism-token prism-function">install</span> -y shellinabox <span class="prism-token prism-operator">&&</span> \
    <span class="prism-token prism-function">apt-get</span> clean <span class="prism-token prism-operator">&&</span> \
    <span class="prism-token prism-function">rm</span> -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

<span class="prism-token prism-comment" spellcheck="true"># 设置 root 用户的密码为 'root'</span>
RUN <span class="prism-token prism-keyword">echo</span> <span class="prism-token prism-string">'root:frepai'</span> <span class="prism-token prism-operator">|</span> chpasswd

<span class="prism-token prism-comment" spellcheck="true"># 暴露 22 端口</span>
EXPOSE 22

<span class="prism-token prism-comment" spellcheck="true"># 启动 Shellinabox</span>
CMD <span class="prism-token prism-punctuation">[</span><span class="prism-token prism-string">"/usr/bin/shellinaboxd"</span>, <span class="prism-token prism-string">"-t"</span>, <span class="prism-token prism-string">"-s"</span>, <span class="prism-token prism-string">"/:LOGIN"</span><span class="prism-token prism-punctuation">]</span>
