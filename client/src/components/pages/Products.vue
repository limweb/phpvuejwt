<template>
    <div>
        <h1>Products</h1>

        <hr/>

        <div v-for="user in users" style="margin-bottom: 5px;">
            {{ user.title }}
            <span style="float:right;">
                <a v-on:click="loginOther(user)" href="javascript:void(0);">login as</a>
            </span>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                context: 'users context',
                users: null
            };
        },

        mounted() {
            this.getUsers();
        },

        methods: {
            getUsers() {
                this.$http({
                    url: '/product/test',
                    method: 'GET'
                })
                .then((res) => {
                    this.users = res.data.data.items;
                    
                    console.log('success ' + this.context);
                }, (res) => {
                    console.log('error ' + this.context);
                });
            },

            loginOther(user) {
                this.$http({
                    url: '/product/show/'+user.id,
                    method: 'GET'
                })
                .then((res) => {
                    this.users = res.data.data.items;
                    
                    console.log('success ' + this.context);
                }, (res) => {
                    console.log('error ' + this.context);
                });
            }
        }
    }
</script>
