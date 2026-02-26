<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<div class="user-page">
	<div class="container-fluid">
		<div class="container">
			<h3>JOIN</h3>
			<form id="join-form">
				<table class="join-table">
					<tr class="join-topbox">
						<th class="join-topth">会員情報</th>
					</tr>
					<tr>
						<th class="join-th">ユーザーID</th>
						<td>
							<input class="join-box mt-3" type="text" name="user_id" id="user_id">
							<p class="id-msg join-msg"></p>
							<p class="id-reg join-guide ">英小文字・数字、4〜16文字</p>
						</td>
					</tr>
					<tr>
						<th class="join-th">パスワード</th>
						<td>
							<input class="join-box mt-3" type="password" name="user_pw" id="user_pw">
							<p class="pw-msg join-msg"></p>
							<p class="pw-reg join-guide">英字・数字・記号のうち2種類以上、10〜16文字</p>
						</td>

					</tr>
					<tr>
						<th class="join-th">パスワード確認</th>
						<td>
							<input class="join-box" type="password" name="user_pwok" id="user_pwok">
							<p class="pwok-msg join-msg"></p>
						</td>
					</tr>
					<tr>
						<th class="join-th">お名前</th>
						<td>
							<input class="join-box" type="text" name="user_name" id="user_name">
							<p class="name-msg join-msg"></p>
						</td>
					</tr>
					<tr>
						<th class="join-th">電話番号</th>
						<td>
						<select class="join-tel"name="user_tel1" id="user_tel1">
							<option value=""></option>
							<option value="010">010</option>
							<option value="090">090</option>
							<option value="080">080</option>
						</select>- 
						<input class="join-tel" type="tel" name="user_tel2" id="user_tel2" maxlength="4">- 
						<input class="join-tel" type="tel" name="user_tel3" id="user_tel3" maxlength="4">
						<input type="hidden" id="tel" name="user_tel">
						<p class="tel-msg join-msg"></p>
						</td>
					</tr>
					<tr>
						<th class="join-th">E-Mail</th>
						<td>
							<input class="join-box" type="email" name="user_email" id="user_email">
							<p class="email-msg join-msg"></p>
						</td>
					</tr>
					<tr class="join-btn" >
						<td colspan="2"><button class="join-submit" type="button">JOIN</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>
